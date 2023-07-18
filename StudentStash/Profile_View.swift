
import SwiftUI

struct Profile_View: View {
    var body: some View {
        ZStack{
            Color.white
            Image(systemName: "person.crop.circle")
                .foregroundColor(Color.black)
                .font(.system(size:100.0))
    }
}
}

struct Profile_View_Previews: PreviewProvider {
    static var previews: some View {
        Profile_View()
    }
}
