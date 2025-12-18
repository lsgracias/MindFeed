//
//  UserProfileView.swift
//  MindFeed
//
//  Created by Lauren Gracias on 11/17/25.
//

import SwiftUI

struct UserProfileView: View {
    let user = User.sample
    @State private var selectedTab = "Saved"
    @Environment(\.dismiss) var dismiss
    
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
                    
                    Text("Profile")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        Image(systemName: "gearshape")
                            .font(.system(size: 24))
                            .foregroundColor(.primary)
                            .frame(width: 48, height: 48)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                
                // Profile Header
                VStack(spacing: 16) {
                    AsyncImage(url: URL(string: user.profileImageURL)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Circle()
                            .fill(Color.gray.opacity(0.3))
                    }
                    .frame(width: 128, height: 128)
                    .clipShape(Circle())
                    
                    VStack(spacing: 4) {
                        Text(user.name)
                            .font(.system(size: 22, weight: .bold))
                            .foregroundColor(.primary)
                        
                        Text(user.username)
                            .font(.system(size: 16))
                            .foregroundColor(.secondary)
                    }
                    
                    Button(action: {}) {
                        Text("Edit Profile")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.primary)
                            .frame(maxWidth: .infinity)
                            .frame(height: 40)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.vertical, 16)
                .frame(maxWidth: .infinity)
                
                // Stats
                HStack(spacing: 12) {
                    StatCard(title: "Topics Explored", value: "\(user.topicsExplored)")
                    StatCard(title: "Videos Completed", value: "\(user.videosCompleted)")
                    StatCard(title: "Hours Learned", value: "\(user.hoursLearned)")
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
                
                // Learning Progress
                VStack(alignment: .leading, spacing: 16) {
                    Text("Learning Progress")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.primary)
                        .padding(.horizontal, 16)
                    
                    ForEach(user.learningProgress) { progress in
                        ProgressRow(progress: progress)
                            .padding(.horizontal, 16)
                    }
                }
                .padding(.bottom, 20)
                
                // My Library
                VStack(alignment: .leading, spacing: 12) {
                    Text("My Library")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.primary)
                        .padding(.horizontal, 16)
                    
                    // Tab Navigation
                    HStack(spacing: 8) {
                        TabButton(title: "Saved", isSelected: selectedTab == "Saved") {
                            selectedTab = "Saved"
                        }
                        TabButton(title: "History", isSelected: selectedTab == "History") {
                            selectedTab = "History"
                        }
                        TabButton(title: "My Notes", isSelected: selectedTab == "My Notes") {
                            selectedTab = "My Notes"
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    // Content Grid
                    LazyVGrid(columns: [
                        GridItem(.flexible(), spacing: 16),
                        GridItem(.flexible(), spacing: 16)
                    ], spacing: 16) {
                        LibraryVideoCard()
                        LibraryVideoCard()
                        LibraryVideoCard()
                        LibraryVideoCard()
                    }
                    .padding(.horizontal, 16)
                }
                .padding(.bottom, 20)
            }
        }
        .background(Color(UIColor.systemBackground))
    }
}

struct StatCard: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.secondary)
            
            Text(value)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(12)
    }
}

struct ProgressRow: View {
    let progress: LearningProgress
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(progress.topic)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primary)
                
                Spacer()
                
                Text("\(progress.percentage)%")
                    .font(.system(size: 14))
                    .foregroundColor(.secondary)
            }
            
            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(Color(UIColor.secondarySystemBackground))
                        .frame(height: 8)
                        .cornerRadius(4)
                    
                    Rectangle()
                        .fill(AppTheme.primary)
                        .frame(width: geometry.size.width * CGFloat(progress.percentage) / 100, height: 8)
                        .cornerRadius(4)
                }
            }
            .frame(height: 8)
        }
    }
}

struct TabButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(isSelected ? .white : .primary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
                .background(isSelected ? AppTheme.primary : Color.clear)
                .cornerRadius(8)
        }
    }
}

struct LibraryVideoCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: "https://lh3.googleusercontent.com/aida-public/AB6AXuCFSullFMx-IqSjvRk1rYds72ICLmOPoPJiswGSaC4ZEbZuSNee66qGeL_VPCVfwO4Ox3CFb7a4Qn0usAk2vpezh9eFG1JlsbOAqG8WkE36k3d0wRIwi1OoidivMXdqWOzr4AL4FZtWFZVQFOUgXEPsWwzkKuO8h86km2qbyitEmISr2UgPMNZSWRL1tz7vpEaKlYMHGSYt8L3cHiZ2ivLXnyLOzv-iYL9lQ12RwlDfZZYed9ZwMYjHbGltMu8X37RkT-VFK3hDziI")) { image in
                image
                    .resizable()
                    .aspectRatio(4/3, contentMode: .fill)
            } placeholder: {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
            }
            .frame(height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text("The Science of Memory")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.primary)
                .lineLimit(2)
            
            Text("Psychology")
                .font(.system(size: 12))
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    UserProfileView()
}

