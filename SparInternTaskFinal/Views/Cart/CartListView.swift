import SwiftUI

struct CartListView: View {
    var catalogList: CatalogList

    var gridSpacing: CGFloat = 0
    var gridLayout = [ GridItem(.flexible()) ]

    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: gridSpacing) {
            ForEach(catalogList.products) { item in
                VStack(spacing: 0) {
                    CatalogListRowView(isFromCart: true, product: item)
                        .background(.white)

                    Divider()
                        .background(Color.gray)
                        .frame(height: 1)
                }
            }
        }
    }
}

struct CartListView_Previews: PreviewProvider {
    static var previews: some View {
        CartListView(catalogList: CatalogList())
    }
}
