import SwiftUI
struct AvatarView: View {
    let url: URL
    let size: CGFloat
    var body: some View {
        AsyncImage(url: url){ image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Image(systemName: "photo.fill")
        }
        .frame(width: size, height: size)
        .cornerRadius(size / 2)
        .overlay(
            Circle()
                .stroke(Color.white, lineWidth: 4)
                .frame(width: size, height: size)
        )
        .shadow(radius: 10)
    }
}
