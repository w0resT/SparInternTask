import SwiftUI

struct CartEmptyView: View {
    @Binding var selectedTab: Int

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Text(L10n.cartOrderEmpty)
                .font(.subheadline)
                .padding(8)
                .multilineTextAlignment(.center)

            Button {
                selectedTab = 0
            } label: {
                Text(L10n.cartLinkToCatalog)
                    .frame(maxWidth: .infinity)
                    .frame(height: 58)
                    .background(Color(uiColor: UIColor(named: "buttonColor") ?? .green))
                    .foregroundColor(.white)
                    .bold()
                    .cornerRadius(40)
                    .padding(.horizontal, 48)
                    .padding(.vertical, 8)
            }
        }
    }
}

struct CartEmptyView_Previews: PreviewProvider {
    static var previews: some View {
        CartEmptyView(selectedTab: .constant(1))
    }
}
