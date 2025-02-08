//
//  ImageContentView.swift
//  JeongKimchi
//
//  Created by Oliver Park on 2/8/25.
//

import SwiftUI

struct ImageContentView: View {
    @StateObject var imageData = ImageData()
    @State var showImagePicker: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                if imageData.imageNote.isEmpty {
                    Text("Try adding an image!")
                        .italic()
                        .foregroundColor(.gray)
                } else {
                    ImageHomeView()
                }
            }
            .navigationTitle("iReceipt")
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(sourceType: .photoLibrary) { image in
                    imageData.addNote(image: image,
                                      title: "Edit me!",
                                      desc: "")
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showImagePicker.toggle()
                    } label: {
                        Label("Image", systemImage: "photo.on.rectangle.angled")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        withAnimation {
                            imageData.resetUserData()
                        }
                    } label: {
                        Label("Image", systemImage: "trash")
                    }
                    .tint(.red)
                }
            }
        }
        .environmentObject(imageData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ImageContentView()
    }
}
