//
//  WelcomeScreen.swift
//  MindFeed
//
//  Created by Lauren Gracias on 11/17/25.
//

import SwiftUI

struct WelcomeScreen: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            AppTheme.backgroundDark
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Spacer()
                
                // App Logo
                HStack(spacing: 8) {
                    Image(systemName: "brain.head.profile")
                        .font(.system(size: 32))
                        .foregroundColor(.white)
                    Text("MindFeed")
                        .font(.system(size: 28, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .tracking(-0.5)
                }
                .padding(.top, 32)
                .padding(.bottom, 16)
                
                // Hero Visual
                AsyncImage(url: URL(string: "https://lh3.googleusercontent.com/aida-public/AB6AXuDvh2j17-rfZT8hqfUGjWfrRrA1xybhZsfoFW39R0BGKKIYqwzUlgrL8qnsgGEu6QEAkF1AG21mQaklZqCEdcGmM7eCcxgHyuLitHkFUjI4WWLE_AZXhh3rQkkyRdn5mlD9jTIiTdjdkvkS4Cx6NsK1Ji8qrKiaoOZvjMm7QQ1O00s-JIhePIVbQSZ_csZlWa_sHlgVqH_IjONrXhPb4jrv9AfDGFaaQ6hwgbt6GpN_4zvxCEO-MyiNBHNzxACX9XMPEg1mD8E7XUU")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                }
                .frame(maxWidth: 300, maxHeight: 300)
                .clipShape(Circle())
                .padding(.vertical, 12)
                
                // Headline
                Text("Smarter in Seconds.")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .padding(.top, 24)
                    .padding(.bottom, 12)
                
                // Body Text
                Text("Discover bite-sized educational videos from the world's best creators.")
                    .font(.system(size: 16))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 12)
                
                Spacer()
                
                // Get Started Button
                Button(action: {
                    isPresented = false
                }) {
                    Text("Get Started")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 48)
                        .background(AppTheme.primary)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                
                // Log In Link
                Button(action: {
                    // Handle log in
                }) {
                    Text("Already have an account? Log In")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "93a5c8"))
                        .underline()
                }
                .padding(.bottom, 32)
            }
        }
    }
}

#Preview {
    WelcomeScreen(isPresented: .constant(true))
}

