import SwiftUI

struct CatalogView: View {
    @ObservedObject var viewModel: CatalogViewModel
    @State private var isGridView = true

    var body: some View {
        VStack {
            ScrollView {
                HStack {
                    // Button to change the type of view: Grid / List
                    Button {
                        isGridView.toggle()
                    } label: {
                        Image(systemName: isGridView ? "square.grid.2x2" : "rectangle.grid.1x2")
                            .resizable()
                            .frame(width: 18, height: 18)
                            .tint(Color(uiColor: UIColor(named: "buttonColor") ?? .green))
                            .padding()
                            .bold()
                    }
                    .frame(width: 40, height: 40)
                    .background(Color(uiColor: UIColor(named: "backgroundColor") ?? .gray))
                    .cornerRadius(12)

                    Spacer()
                }
                .padding(.leading, 8)

                Divider()
                    .background(Color.gray)
                    .frame(height: 1)

                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(.circular)
                } else {
                    if isGridView {
                        CatalogGridView(catalogList: viewModel.dataSource)
                    } else {
                        CatalogListView(catalogList: viewModel.dataSource)
                    }
                }
            }
        }
        .onAppear {
            viewModel.updateCatalog()
        }
    }
}

struct CatalogView_Previews: PreviewProvider {
    static var previews: some View {
        CatalogView(viewModel: CatalogViewModel())
    }
}
