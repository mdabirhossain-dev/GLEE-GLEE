//
//  Video.swift
//  GLEE GLEE
//
//  Created by Md Abir Hossain on 19/2/24.
//

import UIKit

class Video {
    var videoID: String
    var name: String
    var artist: String
    var description: String
    var videoURL: String
    var thumbnailURL: String
    var releasedYear: String
    var totalEpisode: String
    var ageRestriction: String
    init(videoID: String,name: String, year: String,episode: String, age: String,description: String, artist: String, videoURL: String, thumbnailURL: String) {
        self.videoID = videoID
        self.name = name
        self.artist = artist
        self.description = description
        self.videoURL = videoURL
        self.thumbnailURL = thumbnailURL
        self.ageRestriction = age
        self.releasedYear = year
        self.totalEpisode = episode
    }
}

var videos: [Video] = [

    Video.init(videoID: "11", name: "Manifest",year: "2023",episode: "3", age: "15", description: "When a plane mysteriously lands years after takeoff, the people onboard return to a world that has moved on without them and face strange new realities.", artist: "JW-Platform", videoURL:  "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8", thumbnailURL: "movie1"),
    Video.init(videoID: "12", name: "Skate Phantom Flex",year: "2022",episode: "1", age: "17", description: "Bringing on Ty Evans was such a good idea for Brain Farm. Curt Morgan is changing the world of video as we know it. I would kill to work with these guys.", artist: "Brain Farm", videoURL: "http://sample.vodobox.net/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8", thumbnailURL: "movie2"),
    Video.init(videoID: "13", name: "Big Bunny",year: "2013",episode: "2", age: "05", description: "Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself. When one sunny day three rodents rudely harass him, something snaps... and the rabbit ain't no bunny anymore! In the typical cartoon tradition he prepares the nasty rodents a comical revenge.\n\nLicensed under the Creative Commons Attribution license", artist: "Google", videoURL: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8", thumbnailURL: "movie3"),
    Video.init(videoID: "14", name: "Sintel",year: "2020",episode: "4", age: "13", description: "Sintel is an independently produced short film, initiated by the Blender Foundation as a means to further improve and validate the free/open source 3D creation suite Blender. With initial funding provided by 1000s of donations via the internet community, it has again proven to be a viable development model for both open 3D technology as for independent animation film.\nThis 15 minute film has been realized in the studio of the Amsterdam Blender Institute, by an international team of artists and developers. In addition to that, several crucial technical and creative targets have been realized online, by developers and artists and teams all over the world.\nwww.sintel.org", artist: "Blender Foundation", videoURL: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8", thumbnailURL: "movie4"),
    Video.init(videoID: "15", name: "Tears of Steel",year: "2021",episode: "5", age: "20", description: "Tears of Steel was realized with crowd-funding by users of the open source 3D creation tool Blender. Target was to improve and test a complete open and free pipeline for visual effects in film - and to make a compelling sci-fi film in Amsterdam, the Netherlands.  The film itself, and all raw material used for making it, have been released under the Creatieve Commons 3.0 Attribution license. Visit the tearsofsteel.org website to find out more about this, or to purchase the 4-DVD box with a lot of extras.  (CC) Blender Foundation - http://www.tearsofsteel.org", artist: "Blender Foundation", videoURL: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8", thumbnailURL: "movie5"),
    Video.init(videoID: "16", name: "Rendition Yoga",year: "2010",episode: "1", age: "25", description: "Yoga combines physical postures, breath control, and meditation for holistic well-being. Exercise enhances fitness and energy. Both contribute to overall health, promoting flexibility, strength, and mental clarity for a balanced lifestyle.", artist: "Multiresolution", videoURL: "https://d1gnaphp93fop2.cloudfront.net/videos/multiresolution/rendition_new10.m3u8", thumbnailURL: "movie6"),
    
    Video.init(videoID: "18", name: "Healt Tips",year: "2009",episode: "3", age: "21", description: "Prioritize a balanced diet rich in fruits, vegetables, and whole grains. Limit processed foods and sugars. Stay hydrated. Portion control is key. Regular exercise and adequate sleep complement a healthy lifestyle.", artist: "Cloudfront", videoURL: "https://diceyk6a7voy4.cloudfront.net/e78752a1-2e83-43fa-85ae-3d508be29366/hls/fitfest-sample-1_Ott_Hls_Ts_Avc_Aac_16x9_1280x720p_30Hz_6.0Mbps_qvbr.m3u8", thumbnailURL: "movie7"),
    Video.init(videoID: "19", name: "Red Bull Flugtag",year: "2005",episode: "1", age: "30", description: "A quirky and entertaining event where teams build homemade, human-powered flying machines and launch them off piers into the water.", artist: "Redbull", videoURL: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8", thumbnailURL: "movie8"),
    Video.init(videoID: "20", name: "Apple Event 2010, the first ever iPad",year: "2010",episode: "2", age: "10", description: "The Apple Event 2010 showcased the iPhone 4 with a sleek design, Retina display, and FaceTime. iOS 4 introduced multitasking. The event also highlighted the MacBook Air's slim profile.", artist: "Apple", videoURL: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8", thumbnailURL: "movie9"),
    Video.init(videoID: "21", name: "Lemon & Mint Juice",year: "2018",episode: "1", age: "12", description: "Rejuvenate with a detoxifying blend of cucumber and mint.", artist: "AFCDN", videoURL: "https://assets.afcdn.com/video49/20210722/v_645516.m3u8", thumbnailURL: "movie10"),
    Video.init(videoID: "22", name: "Face Dannykeane",year: "2018",episode: "1", age: "15", description: "Face cartoon show as like iOS sticker. For better resulation & show face.", artist: "Dannykeane", videoURL: "https://res.cloudinary.com/dannykeane/video/upload/sp_full_hd/q_80:qmax_90,ac_none/v1/dk-memoji-dark.m3u8", thumbnailURL: "movie11")
    
]

var part1Videos: [Video] = [
    Video.init(videoID: "111", name: "Rendition Yoga",year: "2007",episode: "2", age: "15", description: "Yoga combines physical postures, breath control, and meditation for holistic well-being. Exercise enhances fitness and energy. Both contribute to overall health, promoting flexibility, strength, and mental clarity for a balanced lifestyle.", artist: "Multiresolution", videoURL: "https://d1gnaphp93fop2.cloudfront.net/videos/multiresolution/rendition_new10.m3u8", thumbnailURL: "movie8"),
    Video.init(videoID: "113", name: "Healt Tips",year: "2009",episode: "3", age: "35", description: "Prioritize a balanced diet rich in fruits, vegetables, and whole grains. Limit processed foods and sugars. Stay hydrated. Portion control is key. Regular exercise and adequate sleep complement a healthy lifestyle.", artist: "Cloudfront", videoURL: "https://diceyk6a7voy4.cloudfront.net/e78752a1-2e83-43fa-85ae-3d508be29366/hls/fitfest-sample-1_Ott_Hls_Ts_Avc_Aac_16x9_1280x720p_30Hz_6.0Mbps_qvbr.m3u8", thumbnailURL: "movie14"),
    Video.init(videoID: "114", name: "Manifest",year: "2022",episode: "3", age: "19", description: "When a plane mysteriously lands years after takeoff, the people onboard return to a world that has moved on without them and face strange new realities.", artist: "JW-Platform", videoURL:  "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8", thumbnailURL: "movie15"),
    Video.init(videoID: "115", name: "Red Bull Flugtag",year: "2003",episode: "3", age: "22", description: "A quirky and entertaining event where teams build homemade, human-powered flying machines and launch them off piers into the water.", artist: "Redbull", videoURL: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8", thumbnailURL: "movie16")
]
var part2Videos: [Video] = [
    Video.init(videoID: "222", name: "Manifest",year: "2023",episode: "3", age: "15", description: "When a plane mysteriously lands years after takeoff, the people onboard return to a world that has moved on without them and face strange new realities.", artist: "JW-Platform", videoURL:  "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8", thumbnailURL: "movie9"),
    Video.init(videoID: "223", name: "Skate Phantom Flex",year: "2021",episode: "2", age: "11", description: "Bringing on Ty Evans was such a good idea for Brain Farm. Curt Morgan is changing the world of video as we know it. I would kill to work with these guys.", artist: "Brain Farm", videoURL: "http://sample.vodobox.net/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8", thumbnailURL: "movie5"),
    Video.init(videoID: "224", name: "Big Bunny",year: "2013",episode: "1", age: "01", description: "Big Buck Bunny tells the story of a giant rabbit with a heart bigger than himself. When one sunny day three rodents rudely harass him, something snaps... and the rabbit ain't no bunny anymore! In the typical cartoon tradition he prepares the nasty rodents a comical revenge.\n\nLicensed under the Creative Commons Attribution license", artist: "Google", videoURL: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8", thumbnailURL: "movie13"),
    Video.init(videoID: "225", name: "Sintel",year: "2005",episode: "3", age: "15", description: "Sintel is an independently produced short film, initiated by the Blender Foundation as a means to further improve and validate the free/open source 3D creation suite Blender. With initial funding provided by 1000s of donations via the internet community, it has again proven to be a viable development model for both open 3D technology as for independent animation film.\nThis 15 minute film has been realized in the studio of the Amsterdam Blender Institute, by an international team of artists and developers. In addition to that, several crucial technical and creative targets have been realized online, by developers and artists and teams all over the world.\nwww.sintel.org", artist: "Blender Foundation", videoURL: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8", thumbnailURL: "movie10")
]

var part3Videos: [Video] = [
    Video.init(videoID: "333", name: "Red Bull Flugtag",year: "2003",episode: "3", age: "45", description: "A quirky and entertaining event where teams build homemade, human-powered flying machines and launch them off piers into the water.", artist: "Redbull", videoURL: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8", thumbnailURL: "movie8"),
    Video.init(videoID: "334", name: "Apple Event 2010",year: "2010",episode: "2", age: "18", description: "The Apple Event 2010 showcased the iPhone 4 with a sleek design, Retina display, and FaceTime. iOS 4 introduced multitasking. The event also highlighted the MacBook Air's slim profile.", artist: "Apple", videoURL: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8", thumbnailURL: "movie9"),
    Video.init(videoID: "335", name: "Lemon & Mint Juice",year: "2001",episode: "1", age: "15", description: "Rejuvenate with a detoxifying blend of cucumber and mint.", artist: "AFCDN", videoURL: "https://assets.afcdn.com/video49/20210722/v_645516.m3u8", thumbnailURL: "movie13")

]

var moreLikeThisVideos: [Video] = [
    Video.init(videoID: "444", name: "Maniforest",year: "2023",episode: "3", age: "25", description: "When a plane mysteriously lands years after takeoff, the people onboard return to a world that has moved on without them and face strange new realities.", artist: "JW-Platform", videoURL:  "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8", thumbnailURL: "movie11"),
    Video.init(videoID: "445", name: "Phantom Flexiload",year: "2033",episode: "3", age: "115", description: "Bringing on Ty Evans was such a good idea for Brain Farm. Curt Morgan is changing the world of video as we know it. I would kill to work with these guys.", artist: "Brain Farm", videoURL: "http://sample.vodobox.net/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8", thumbnailURL: "movie2")
]

var posterVideos: [Video] = [
    Video(videoID: "p11", name: "BATMAN", year: "2013", episode: "1", age: "12+", description: "Reclusive billionaire Bruce Wayne, who has operated for two years as the vigilante Batman, investigates the murder alongside the Gotham City Police Department (GCPD).Plot. On Halloween, Gotham City mayor Don Mitchell Jr. is murdered by the Riddler, a masked serial killer. Reclusive billionaire Bruce Wayne, who has operated for two years as the vigilante Batman", artist: "DC", videoURL: "https://bitdash-a.akamaihd.net/content/MI201109210084_1/m3u8s/f08e80da-bf1d-4e3d-8899-f0f6155f6efa.m3u8", thumbnailURL: "one"),
    Video(videoID: "p12", name: "WANDER WOMEN", year: "2012", episode: "1", age: "17+", description: "Plot. On Halloween, Gotham City mayor Don Mitchell Jr. is murdered by the Riddler, a masked serial killer. Reclusive billionaire Bruce Wayne, who has operated for two years as the vigilante Batman, investigates the murder alongside the Gotham City Police Department (GCPD).", artist: "DC", videoURL: "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8" , thumbnailURL:  "three"),
    Video(videoID: "p13", name:  "SUPER MARIO", year: "2012", episode: "2", age: "10+", description: "Reclusive billionaire Bruce Wayne,Reclusive billionaire Bruce Wayne,Reclusive billionaire Bruce Wayne,Plot. On Halloween, Gotham City mayor Don Mitchell Jr. is murdered by the Riddler, a masked serial killer. Reclusive billionaire Bruce Wayne, who has operated for two years as the vigilante Batman, investigates the murder alongside the Gotham", artist: "CN", videoURL: "https://test-streams.mux.dev/x36xhzz/x36xhzz.m3u8", thumbnailURL: "five"),
    Video(videoID: "p14", name: "BATMAN THE DARK KNIGHT", year: "2013", episode: "1", age: "14+", description: "Plot. On Halloween, Gotham City mayor Don Mitchell Jr. is murdered by the Riddler, a masked serial killer. Reclusive bi has operated for two years as the vigilante Batman, investigates the murderllionaire Bruce Wayne, who has operated for two years as the vigilante Batman, investigates the murder alongside the Gotham City Police Department (GCPD).", artist: "Justice League", videoURL: "https://d1gnaphp93fop2.cloudfront.net/videos/multiresolution/rendition_new10.m3u8", thumbnailURL: "four"),
    Video(videoID: "p15", name: "IRON MAN 3", year: "2006", episode: "1", age: "14+", description: "He has operated for two years as the vigilante Batman, investigates the murderPlot. On Halloween, Gotham City mayor Don Mitchell Jr. is murdered by the Riddler, a masked serial killer. Reclusive billionaire Bruce Wayne, who has operated for two years as the vigilante Batman, investigates the murder alongside the Gotham City Police Department (GCPD).", artist: "Marvel", videoURL: "http://content.jwplatform.com/manifests/vM7nH0Kl.m3u8", thumbnailURL: "two")
]

let allVideos: [Video] = videos + part1Videos + part2Videos + part3Videos + moreLikeThisVideos + posterVideos
