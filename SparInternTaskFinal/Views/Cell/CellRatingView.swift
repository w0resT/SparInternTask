import SwiftUI

struct CellRatingView: View {
    var rating: Float
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.yellow)
                .frame(width: 16, height: 16)
                .padding(.leading, 4)

            Text(String(rating))
                .font(.caption)
                .foregroundColor(.black)
        }
    }
}

struct CellRatingView_Previews: PreviewProvider {
    static var previews: some View {
        CellRatingView(rating: 4.7)
    }
}
