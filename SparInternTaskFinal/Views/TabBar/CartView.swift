import SwiftUI

struct CartView: View {
    @ObservedObject var cartViewModel: CartViewModel
    @Binding var selectedTab: Int

    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            // Title
            Text(L10n.mainCartTitle)
                .font(.headline)
                .padding(.bottom, 10)

            Divider()
                .background(Color.gray)
                .frame(height: 1)

            if cartViewModel.dataSource.isEmpty {
                Spacer()
                CartEmptyView(selectedTab: $selectedTab)
                Spacer()
            } else {
                // Label Order composition
                HStack(alignment: .top, spacing: 0) {
                    Text(L10n.cartOrderComposition)
                        .font(.title2)
                        .bold()
                        .padding(8)

                    Spacer()
                }

                Divider()
                    .background(Color.gray)
                    .frame(height: 1)

                CartListView(catalogList: cartViewModel.transformToCatalogList())
                CartButtonClearView(cartViewModel: cartViewModel)

                Spacer()
            }
        }
        .onAppear {
            cartViewModel.fetchProducts()
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cartViewModel: CartViewModel(), selectedTab: .constant(1))
    }
}
