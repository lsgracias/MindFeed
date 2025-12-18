//
//  VideoDetailView.swift
//  MindFeed
//
//  Created by Lauren Gracias on 11/17/25.
//

import SwiftUI

struct VideoDetailView: View {
    let video: Video
    @Environment(\.dismiss) var dismiss
    @State private var isExpanded = false
    @State private var isFollowing = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Top App Bar
                HStack {
                    Button(action: { dismiss() }) {
                        Image(systemName: "arrow.left")
                            .font(.system(size: 24))
                            .foregroundColor(.primary)
                            .frame(width: 48, height: 48)
                    }
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "ellipsis")
                            .font(.system(size: 24))
                            .foregroundColor(.primary)
                            .frame(width: 48, height: 48)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                
                // Video Player
                GeometryReader { geometry in
                    let videoWidth = geometry.size.width
                    let videoHeight = videoWidth * 9 / 16 // 16:9 aspect ratio
                    
                    ZStack {
                        AsyncImage(url: URL(string: video.thumbnailURL)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                        } placeholder: {
                            Rectangle()
                                .fill(Color.gray.opacity(0.3))
                        }
                        .frame(width: videoWidth, height: videoHeight)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                        Button(action: {}) {
                            ZStack {
                                Circle()
                                    .fill(Color.black.opacity(0.4))
                                    .frame(width: 64, height: 64)
                                
                                Image(systemName: "play.fill")
                                    .font(.system(size: 32))
                                    .foregroundColor(.white)
                            }
                        }
                        
                        VStack {
                            Spacer()
                            HStack {
                                // Progress bar
                                GeometryReader { progressGeometry in
                                    ZStack(alignment: .leading) {
                                        Rectangle()
                                            .fill(Color.white.opacity(0.4))
                                            .frame(height: 4)
                                        
                                        Rectangle()
                                            .fill(AppTheme.accent)
                                            .frame(width: progressGeometry.size.width * 0.4, height: 4)
                                        
                                        Circle()
                                            .fill(AppTheme.accent)
                                            .frame(width: 12, height: 12)
                                            .offset(x: progressGeometry.size.width * 0.4 - 6)
                                    }
                                }
                                .frame(height: 4)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 8)
                            
                            HStack {
                                Text("1:45")
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.white)
                                
                                Spacer()
                                
                                Text(video.duration)
                                    .font(.system(size: 12, weight: .medium))
                                    .foregroundColor(.white)
                            }
                            .padding(.horizontal, 16)
                            .padding(.bottom, 12)
                        }
                    }
                    .frame(height: videoHeight)
                }
                .aspectRatio(16/9, contentMode: .fit)
                .padding(.horizontal, 16)
                
                // Title
                Text(video.title)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.primary)
                    .padding(.horizontal, 16)
                    .padding(.top, 24)
                
                // Stats
                Text("\(formatViews(video.views)) views • 3 days ago")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 16)
                    .padding(.top, 4)
                    .padding(.bottom, 16)
                
                // Creator Info
                HStack {
                    AsyncImage(url: URL(string: video.creatorImageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                    }
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(video.creator)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.primary)
                        
                        Text("Astrophysicist")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    Button(action: { isFollowing.toggle() }) {
                        Text(isFollowing ? "Following" : "Follow")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 8)
                            .background(isFollowing ? Color.gray : AppTheme.primary)
                            .cornerRadius(20)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                .background(Color(UIColor.secondarySystemBackground))
                
                // Actions
                HStack(spacing: 16) {
                    ActionButtonDetail(icon: "hand.thumbsup", label: formatCount(video.likes), isActive: true)
                    ActionButtonDetail(icon: "bookmark", label: "Save")
                    ActionButtonDetail(icon: "square.and.arrow.up", label: "Share")
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                
                // Description
                VStack(alignment: .leading, spacing: 8) {
                    Text(video.description)
                        .font(.system(size: 14))
                        .foregroundColor(.primary)
                        .lineLimit(isExpanded ? nil : 3)
                    
                    Button(action: { isExpanded.toggle() }) {
                        Text(isExpanded ? "Read Less" : "Read More")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(AppTheme.primary)
                    }
                }
                .padding(16)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(12)
                .padding(.horizontal, 16)
                
                // Topics
                VStack(alignment: .leading, spacing: 12) {
                    Text("Key Topics")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.primary)
                    
                    HStack(spacing: 8) {
                        ForEach(video.tags, id: \.self) { tag in
                            Text(tag)
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(AppTheme.accent)
                                .padding(.horizontal, 16)
                                .padding(.vertical, 8)
                                .background(AppTheme.accent.opacity(0.2))
                                .cornerRadius(16)
                        }
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                
                // Up Next
                VStack(alignment: .leading, spacing: 16) {
                    Text("Up Next")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.primary)
                        .padding(.horizontal, 16)
                    
                    RelatedVideoCard()
                    RelatedVideoCard()
                }
                .padding(.bottom, 20)
            }
        }
        .background(Color(UIColor.systemBackground))
    }
    
    func formatViews(_ views: Int) -> String {
        if views >= 1000000 {
            return String(format: "%.1fM", Double(views) / 1000000.0)
        } else if views >= 1000 {
            return String(format: "%.1fk", Double(views) / 1000.0)
        }
        return "\(views)"
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

struct ActionButtonDetail: View {
    let icon: String
    let label: String
    var isActive: Bool = false
    
    var body: some View {
        VStack(spacing: 8) {
            Button(action: {}) {
                ZStack {
                    Circle()
                        .fill(Color(UIColor.secondarySystemBackground))
                        .frame(width: 48, height: 48)
                    
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundColor(isActive ? AppTheme.primary : .primary)
                }
            }
            
            Text(label)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.primary)
        }
        .frame(width: 80)
    }
}

struct RelatedVideoCard: View {
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: "https://lh3.googleusercontent.com/aida-public/AB6AXuBPwlx5LxrCxxgUNIGx6_BlAHzLYm3QirkXE7d_Z4WDU_E3ZyeBqVKvl5sV7Lo9EVF2ylzw-sE5wdD_oUR44m3fON555DcA640LLj6VLKOLrkLK1wwvZ0tTtCyLiT-INkV-suDG2swkkcXIAq15-s2BFhdo5hEsjRV4W6HJhq2f5z0E5GRNRCZA3QZUd7FboyfeIe0eZHIWU-azST_QFKTYuiD6a1NY2ufbUm8khMzu8k5LTu9ubvC-EpUjDYJxb4K6NfqT9lyqsSk")) { image in
                image
                    .resizable()
                    .aspectRatio(16/9, contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
            }
            .frame(width: 128, height: 72)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                Text("The Search for Dark Matter")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                Text("AstroVeritas")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
                
                Text("890k views")
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    VideoDetailView(video: Video.sampleVideos[0])
}

