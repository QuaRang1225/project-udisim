//
//  ProfileSelectView.swift
//  UdiSIM
//
//  Created by 유영웅 on 2022/11/19.
//

import SwiftUI
import PhotosUI

struct ProfileSelectView: View {
    @Binding var name:String
    @Binding var email:String
    @Binding var password:String
    @Binding var registerSuccess:Bool
    @StateObject var photo = PhotoPicker()
    @EnvironmentObject var vm:AuthenticationViewModel
    
    var body: some View {
        ZStack{
            LinearGradient.udisimColor
            VStack(spacing:0){
                AuthHeaderView(title: "프로필사진")
                Spacer()
                PhotosPicker(selection: $photo.selectItem, maxSelectionCount: 1, matching: .images){
                    if photo.selectPhotoItem.isEmpty{
                        ZStack{
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .modifier(imageModifier())
                            Circle()
                                .stroke(Color.white,lineWidth: 5)
                                .modifier(imageModifier())
                        }
                    }
                    else{
                        ForEach(photo.selectPhotoItem,id: \.self){
                            if let image = UIImage(data: $0){
                                VStack{
                                    Image(uiImage: image)
                                        .resizable()
                                        .clipShape(Circle())
                                        .scaledToFill()
                                        .modifier(imageModifier())
                                    Button {
                                        vm.register(email: email, name: name, password: password)
                                    } label: {
                                        LinearGradient.udisimColor
                                            .mask {
                                                Text("완료")
                                                    .font(.headline)
                                                    .foregroundColor(.white)
                                            }
                                            .frame(width: 250,height: 50)
                                            .background(Color.white)
                                            .clipShape(Capsule())
                                            .padding()
                                    }
                                    
                                    
                                    .shadow(radius: 10)
                                }.onReceive(vm.roginSuccenss){ vm.imageUpload(image)
                                }
                            }
                        }
                    }
                }.onChange(of: photo.selectItem,perform: photo.selectPhoto)
                Spacer()
            }
        }
        .onReceive(vm.successAuth){ _ in
            registerSuccess = false
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
    private struct imageModifier:ViewModifier{
        func body(content: Content) -> some View {
            content
                .frame(width: 250,height: 250)
                .padding()
        }
    }
}

struct ProfileSelectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileSelectView(name: .constant(""), email: .constant(""), password: .constant(""), registerSuccess: .constant(true))
        }
    }
}
