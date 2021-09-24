
import SwiftUI
import MapKit

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var coach: Sport
    var coordinate: CLLocationCoordinate2D
}
struct MapView: View {
    
    @State private var coachSelect: AnnotatedItem?
    
    @State private var isPresented = true
    
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 43.295_119, longitude: 5.379_519),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    private var pointsOfInterest = [
        AnnotatedItem(coach: Sport(coachImage: "tommy", coachName: "Tommy", coachAge: "29 ans", coachHeart: 4), coordinate: .init(latitude: 43.30385971069336, longitude: 5.369717597961426)),
        AnnotatedItem(coach: Sport(coachImage: "johnny", coachName: "Johnny", coachAge: "30 ans", coachHeart: 4), coordinate: .init(latitude: 43.311567, longitude: 5.393377)),
        AnnotatedItem(coach: Sport(coachImage: "isis", coachName: "Isis", coachAge: "26 ans", coachHeart: 3), coordinate: .init(latitude: 43.295119, longitude: 5.379519)),
        AnnotatedItem(coach: Sport(coachImage: "jane", coachName: "Jane", coachAge: "34 ans", coachHeart: 4), coordinate: .init(latitude: 43.288788, longitude: 5.373027)),
        AnnotatedItem(coach: Sport(coachImage: "ylies", coachName: "Ylies", coachAge: "(52) ans", coachHeart: 3), coordinate: .init(latitude: 43.272311, longitude: 5.391323))
    ]
    var body: some View {
        
        ZStack {
            Map(coordinateRegion: $region, annotationItems: pointsOfInterest) { item in
                MapAnnotation(coordinate: item.coordinate) {
                    Button(action: {
                        coachSelect = item
                    }) {
                        Image(item.coach.coachName.lowercased())
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .frame(minWidth: 30, maxWidth: 70, minHeight: 30, maxHeight: 70)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 7)
                            .padding()
                    }
                }
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            if let coachUnselect = coachSelect {
                VStack {
                    Spacer()
                    NavigationLink(destination: CoachProfil()) {
                        HStack {
                            Image(coachUnselect.coach.coachName.lowercased())
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                                .frame(minWidth: 100, maxWidth: 100, minHeight: 90, maxHeight: 100)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .shadow(radius: 7)
                                .padding()
                            
                            ZStack {
                                Rectangle()
                                    .fill(Color.white)
                                    .frame( maxWidth: 300, maxHeight: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .cornerRadius(20)
                                
                                
                                
                                VStack {
                                    Text(coachUnselect.coach.coachName)
                                        .font(.title)
                                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.orange)
                                        .padding(.vertical, 2.0)
                                    
                                    
                                    HStack {
                                        ForEach(0..<5) { heart in
                                            Image(systemName: heart < coachUnselect.coach.coachHeart ? "heart.fill" : "heart")
                                        }
                                        .frame(width: 10, height: 10)
                                        .foregroundColor(.orange)
                                        
                                    }
                                    Text("Marseille")
                                        .foregroundColor(.gray)
                                        .padding(.vertical, 2.0)
                                    
                                }
                                
                            }
                            
                            Spacer()
                            
                        }
                    }
                }
            }
            
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MapView()
        }
    }
}
