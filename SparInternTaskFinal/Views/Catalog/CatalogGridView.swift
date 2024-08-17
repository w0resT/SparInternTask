import SwiftUI

struct CatalogGridView: View {
    var catalogList: CatalogList

    var gridSpacing: CGFloat = 8
    var gridLayout = [ GridItem(.fixed(168), spacing: 10), GridItem(.fixed(168)) ]

    var body: some View {
        LazyVGrid(columns: gridLayout, spacing: gridSpacing) {
            ForEach(catalogList.products) { item in
                 CatalogGridCellView(product: item)
                     .background(.white)
                     .compositingGroup()
                     .cornerRadius(20)
                     .shadow(color: .gray.opacity(0.25), radius: 4)
            }
        }
    }
}

struct CatalogGridView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogGridView(catalogList: CatalogViewModel().dataSource)
    }
}
