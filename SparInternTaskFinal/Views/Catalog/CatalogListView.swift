import SwiftUI

struct CatalogListView: View {
    var catalogList: CatalogList

    var gridSpacing: CGFloat = 0
    var gridLayout = [ GridItem(.flexible()) ]

    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: gridSpacing) {
            ForEach(catalogList.products) { item in
                VStack(spacing: 0) {
                    CatalogListRowView(product: item)
                        .background(.white)

                    if item.id != catalogList.products.last?.id {
                        Divider()
                            .background(Color.gray)
                            .frame(height: 1)
                    }
                }
            }
        }
    }
}

struct CatalogListView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogListView(catalogList: CatalogViewModel().dataSource)
    }
}
