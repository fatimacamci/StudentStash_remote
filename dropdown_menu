import SwiftUI

struct DropdownMenuItemView: View {
    @Binding var isSelecting: Bool
    @Binding var selectiontitle: String
    @Binding var selectionId: Int

    let item: DropdownItem

    var body: some View {
        Button(action: {
            isSelecting = false
            selectiontitle = item.title
            item.onSelect()
        }) {
            HStack {
                Text(item.title)
                    .font(.system(size: 16, weight: .regular, design: .rounded))
                    .font(.custom("Bebas Neue", size:15))
                Spacer()
            }
            .padding(.horizontal)
            .foregroundColor(.black)
        }
    }
}

struct CustomDropdownMenu: View {
    @State var isSelecting = false
    @State var selectionTitle = "Selected option"
    @State var selectedRowId = 0

    var body: some View {
        VStack {
            HStack {
                Text(selectionTitle)
                    .font(.custom("Bebas Neue", size: 15))
                    .font(.system(size: 15, weight: .semibold, design: .rounded))

                Spacer()
                Image(systemName: "chevron.down")
                .font(.system(size: 16, weight: .semibold))
            }
            .padding(.horizontal)
            .foregroundColor(.black)

            if isSelecting {
                Divider()
                    .background(.white)
                    .padding(.horizontal)

                VStack(spacing: 5) {
                    DropdownMenuItemView(isSelecting: $isSelecting, selectiontitle: $selectionTitle, selectionId: $selectedRowId, item: .init(id: 1, title: "Used", onSelect: {}))
                        .font(.custom("Bebas Neue", size: 15))
                    DropdownMenuItemView(isSelecting: $isSelecting, selectiontitle: $selectionTitle, selectionId: $selectedRowId, item: .init(id: 2, title: "New", onSelect: {}))
                        .font(.custom("Bebas Neue", size: 15))
                    DropdownMenuItemView(isSelecting: $isSelecting, selectiontitle: $selectionTitle, selectionId: $selectedRowId, item: .init(id: 3, title: "Fairly New", onSelect: {}))
                        .font(.custom("Bebas Neue", size:15))
                }

            }

        }
        .frame(maxWidth: 300)
        .padding(.vertical)
        .background(Color(uiColor:.white))
        .border(.black)
        .onTapGesture {
            isSelecting.toggle()
        }
    }

}



struct DropdownItem:Identifiable{
    let id:Int
    let title: String
    let onSelect: () -> Void
}

struct CustomDropdownMenu_Previews:PreviewProvider{
    static var previews: some View{
            CustomDropdownMenu()
            .padding(.horizontal)
    }
}
