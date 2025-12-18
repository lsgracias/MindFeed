//
//  ContentFeedView.swift
//  MindFeed
//
//  Created by Lauren Gracias on 11/17/25.
//

import SwiftUI

struct ContentFeedView: View {
    @State private var selectedTab = "For You"
    @State private var videos = Video.sampleVideos
    @State private var selectedTabIndex = 1
    @State private var selectedVideo: Video?
    
    var body: some View {
        ZStack {
            AppTheme.backgroundDark
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top Header Bar
                VStack {
                    HStack {
                        Spacer()
                        HStack(spacing: 0) {
                            Button(action: { selectedTab = "Following"; selectedTabIndex = 0 }) {
                                Text("Following")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(selectedTab == "Following" ? .white : Color(white: 0.7))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .background(selectedTab == "Following" ? Color.white.opacity(0.1) : Color.clear)
                                    .cornerRadius(8)
                            }
                            
                            Button(action: { selectedTab = "For You"; selectedTabIndex = 1 }) {
                                Text("For You")
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundColor(selectedTab == "For You" ? .white : Color(white: 0.7))
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 8)
                                    .background(selectedTab == "For You" ? Color.white.opacity(0.1) : Color.clear)
                                    .cornerRadius(8)
                            }
                        }
                        .frame(width: 200)
                        .padding(4)
                        .background(Color.black.opacity(0.4))
                        .cornerRadius(12)
                        .blur(radius: 0.5)
                        Spacer()
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 16)
                }
                
                // Video Feed
                TabView(selection: $selectedTabIndex) {
                    ForEach(Array(videos.enumerated()), id: \.element.id) { index, video in
                        VideoFeedCard(video: video, onTap: {
                            selectedVideo = video
                        })
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea(.all, edges: .vertical)
                .sheet(item: $selectedVideo) { video in
                    NavigationStack {
                        VideoDetailView(video: video)
                    }
                }
                
                // Bottom Navigation
                HStack(spacing: 0) {
                    VStack(spacing: 4) {
                        Image(systemName: "house.fill")
                            .font(.system(size: 24))
                        Text("Home")
                            .font(.system(size: 12, weight: .medium))
                    }
                    .foregroundColor(AppTheme.primary)
                    .frame(maxWidth: .infinity)
                    
                    Button(action: {}) {
                        VStack(spacing: 4) {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 24))
                            Text("Discover")
                                .font(.system(size: 12, weight: .medium))
                        }
                        .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button(action: {}) {
                        ZStack {
                            Circle()
                                .fill(AppTheme.primary)
                                .frame(width: 48, height: 48)
                            Image(systemName: "plus")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundColor(.white)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    Button(action: {}) {
                        VStack(spacing: 4) {
                            Image(systemName: "bookmark")
                                .font(.system(size: 24))
                            Text("Saved")
                                .font(.system(size: 12, weight: .medium))
                        }
                        .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                    
                    NavigationLink(destination: UserProfileView().navigationBarBackButtonHidden(true)) {
                        VStack(spacing: 4) {
                            Image(systemName: "person")
                                .font(.system(size: 24))
                            Text("Profile")
                                .font(.system(size: 12, weight: .medium))
                        }
                        .foregroundColor(.secondary)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.vertical, 8)
                .background(
                    AppTheme.backgroundDark.opacity(0.8)
                        .blur(radius: 10)
                )
            }
        }
    }
}

struct VideoFeedCard: View {
    let video: Video
    let onTap: () -> Void
    @State private var isLiked = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                AsyncImage(url: URL(string: video.thumbnailURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .clipped()
                .overlay(Color.black.opacity(0.2))
                
                VStack {
                    Spacer()
                    
                    HStack(alignment: .bottom, spacing: 16) {
                        // Left: Video Info
                        VStack(alignment: .leading, spacing: 8) {
                            Text(video.creatorHandle)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                            
                            Text(video.title)
                                .font(.system(size: 14))
                                .foregroundColor(Color(white: 0.9))
                                .lineLimit(3)
                            
                            // Tags
                            HStack(spacing: 8) {
                                ForEach(video.tags, id: \.self) { tag in
                                    Text("#\(tag)")
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundColor(.white)
                                        .padding(.horizontal, 12)
                                        .padding(.vertical, 6)
                                        .background(Color.black.opacity(0.4))
                                        .cornerRadius(6)
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .onTapGesture {
                            onTap()
                        }
                        
                        // Right: Action Buttons
                        VStack(spacing: 20) {
                            ActionButton(icon: "lightbulb", count: formatCount(video.likes), isActive: isLiked) {
                                isLiked.toggle()
                            }
                            
                            ActionButton(icon: "bubble.left", count: formatCount(video.comments)) {}
                            
                            ActionButton(icon: "bookmark", count: formatCount(video.bookmarks)) {}
                            
                            ActionButton(icon: "arrowshape.turn.up.right", count: formatCount(video.shares)) {}
                        }
                    }
                    .padding(16)
                }
            }
        }
    }
    
    func formatCount(_ count: Int) -> String {
        if count >= 1000000 {
            return String(format: "%.1fM", Double(count) / 1000000.0)
        } else if count >= 1000 {
            return String(format: "%.1fk", Double(count) / 1000.0)
        }
        return "\(count)"
    }
}

struct ActionButton: View {
    let icon: String
    let count: String
    var isActive: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                ZStack {
                    Circle()
                        .fill(Color.black.opacity(0.4))
                        .frame(width: 48, height: 48)
                        .blur(radius: 0.5)
                    
                    Image(systemName: icon)
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
                
                Text(count)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ContentFeedView()
}

