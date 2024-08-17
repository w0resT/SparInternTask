import SwiftUI

struct CellButtonSwitchView: View {
    @State private var isKg = true

    var body: some View {
        HStack(spacing: 0) {
            Spacer(minLength: 0)
            Button {
                if isKg {
                    isKg.toggle()
                }
            } label: {
                Text("Шт")
                    .foregroundColor(isKg ?
                                     Color(hue: 0, saturation: 0, brightness: 0.15, opacity: 0.6) :
                                     Color(hue: 0, saturation: 0, brightness: 0.15, opacity: 1))
                    .font(.system(size: 14))
            }
            .frame(height: 24)
            .frame(maxWidth: .infinity)
            .background(isKg ? Color(uiColor: UIColor(named: "backgroundColor") ?? .gray) : .white)
            .cornerRadius(8)
            .padding(2)

            Spacer(minLength: 0)

            Button {
                if isKg == false {
                    isKg.toggle()
                }
            } label: {
                Text("Кг")
                    .foregroundColor(isKg ?
                                     Color(hue: 0, saturation: 0, brightness: 0.15, opacity: 1) :
                                     Color(hue: 0, saturation: 0, brightness: 0.15, opacity: 0.6))
                    .font(.system(size: 14))
            }
            .frame(height: 24)
            .frame(maxWidth: .infinity)
            .background(isKg ? .white : Color(uiColor: UIColor(named: "backgroundColor") ?? .gray))
            .cornerRadius(8)
            .padding(2)

            Spacer(minLength: 0)
        }
            .frame(height: 28)
            .background(Color(uiColor: UIColor(named: "backgroundColor") ?? .gray))
            .cornerRadius(8)
            .padding(.horizontal, 5)
    }
}

struct CellButtonSwitchView_Previews: PreviewProvider {
    static var previews: some View {
        CellButtonSwitchView()
    }
}
