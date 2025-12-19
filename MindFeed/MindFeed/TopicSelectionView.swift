//
//  TopicSelectionView.swift
//  MindFeed
//
//  Created by Lauren Gracias on 11/17/25.
//

import SwiftUI

struct TopicSelectionView: View {
    @State private var topics = Topic.allTopics
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    let onComplete: () -> Void
    
    var filteredTopics: [Topic] {
        if searchText.isEmpty {
            return topics
        }
        return topics.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    var selectedCount: Int {
        topics.filter { $0.isSelected }.count
    }
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // Top App Bar
                HStack {
                    Text("Customize Your MindFeed")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.primary)
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 16)
                
                // Search Bar
                HStack(spacing: 0) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.secondary)
                        .padding(.leading, 16)
                    
                    TextField("Search for topics like 'Astrophysics'", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.leading, 8)
                        .padding(.trailing, 16)
                }
                .frame(height: 48)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
                .padding(.horizontal, 16)
                .padding(.bottom, 12)
                
                // Topic Grid
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 16),
                        GridItem(.flexible(), spacing: 16)
                    ], spacing: 16) {
                        ForEach(filteredTopics) { topic in
                            TopicCard(topic: topic) {
                                if let index = topics.firstIndex(where: { $0.id == topic.id }) {
                                    topics[index].isSelected.toggle()
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 100)
                }
            }
            
            // Sticky Bottom Button
            VStack {
                Spacer()
                Button(action: {
                    onComplete()
                }) {
                    Text("Build My Feed (\(selectedCount))")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(AppTheme.primary)
                        .cornerRadius(12)
                        .shadow(color: AppTheme.primary.opacity(0.3), radius: 8, x: 0, y: 4)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                .background(
                    Color(UIColor.systemBackground)
                        .opacity(0.8)
                        .blur(radius: 10)
                )
            }
        }
    }
}

struct TopicCard: View {
    let topic: Topic
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: topic.imageURL)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                }
                .frame(height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                // Overlay gradient
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.black.opacity(0.6),
                        Color.clear
                    ]),
                    startPoint: .bottom,
                    endPoint: .top
                )
                .frame(height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                
                // Check/Add icon
                VStack {
                    HStack {
                        Spacer()
                        ZStack {
                            Circle()
                                .fill(topic.isSelected ? AppTheme.primary : Color.white.opacity(0.2))
                                .frame(width: 32, height: 32)
                                .blur(radius: topic.isSelected ? 0 : 4)
                            
                            Image(systemName: topic.isSelected ? "checkmark" : "plus")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .padding(12)
                    }
                    Spacer()
                }
                
                // Topic name
                Text(topic.name)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .padding(16)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(topic.isSelected ? AppTheme.primary : Color.clear, lineWidth: 2)
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    TopicSelectionView(onComplete: {})
}

