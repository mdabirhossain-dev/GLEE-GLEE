
import SwiftUI

struct MyHistoryItemView: View {
    @State var title: String
    @State var thumbnailUrl: String
    @State var playingDuration: Float
    @State var videoDuration: Float
    var body: some View {
        ZStack {
            Color(UIColor.largeTextFieldBackground ?? .systemBackground)
                .ignoresSafeArea(.all)
                .cornerRadius(5)
            
            VStack(spacing: 0) {
                // Thumb Image
                Image(thumbnailUrl)
                    .resizable()
                    .cornerRadius(5)
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 4) {
                        // Show Title
                        Text("\(title)".uppercased())
                            .font(.custom(FontManager.Poppins.medium, size: 10))
                            .foregroundColor(.primary)
                            .minimumScaleFactor(0.5)
                            .lineLimit(1)
                        // Progress bar
                        ProgressViewSwiftUI(progressPercentasge: Double(playingDuration / videoDuration))
                        
                        // Total Duration
                        Text(calculateShowingVideoTime())
                            .font(.custom(FontManager.Montserrat.medium, size: 8))
                            .foregroundColor(.primary)
                            .padding(.top, -10)
                    }
                    
                    // Play Button
                    Button {
                        
                    } label: {
                        Image("redPlay")
                            .resizable()
                            .frame(width: 20.66/392 * DeviceInfos().deviceWidth, height: 20.66/392 * DeviceInfos().deviceWidth)
                    }
                }
                .frame(height: 30)
                .padding([.horizontal, .vertical], 7/852 * DeviceInfos().deviceHeight)
                .foregroundColor(Color.white)
            }
            .aspectRatio(9/16, contentMode: .fill)
        }
        .cornerRadius(5)
    }
    func calculateShowingVideoTime() -> String{
        let leftTime = videoDuration - playingDuration
        let minutes = leftTime / Float(60)
        let hours = minutes / 60
        
        if hours >= 1 {
            return "\(Int(hours))h & \(Int(leftTime) % 60)m left"
        }else if minutes >= 1 {
            return "\(Int(minutes))m & \(Int(leftTime) % 60)s left"
        }else {
            return "\(Int(leftTime))s left"
        }
    }
}
