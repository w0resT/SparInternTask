import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = CatalogViewModel()
    @StateObject private var cartViewModel = CartViewModel()
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            CatalogView(viewModel: viewModel)
                .tabItem {
                    Label(L10n.mainCatalogTitle, systemImage: "square.grid.2x2")
                }
                .tag(0)
                .environmentObject(cartViewModel)

            CartView(cartViewModel: cartViewModel, selectedTab: $selectedTab)
                .tabItem {
                    Label(L10n.mainCartTitle, systemImage: "cart.fill")
                }
                .tag(1)
                .badge(cartViewModel.dataSource.count)
                .environmentObject(cartViewModel)
        }
        .tint(Color(uiColor: UIColor(named: "buttonColor") ?? .green))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
