import SwiftUI

struct Settings_View: View {
    var body: some View {
        ZStack{
            Color.white
            Image(systemName: "gearshape")
                .foregroundColor(Color.black)
                .font(.system(size:100.0))
        }
}
}

struct Settings_View_Previews: PreviewProvider {
    static var previews: some View {
        Settings_View()
    }
}
