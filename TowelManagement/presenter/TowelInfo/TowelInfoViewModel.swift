//
//  TowelInfoViewModel.swift
//  TowelManagement
//
//  Created by mac on 05/06/2024.
//

import Foundation
import CoreData
import Combine

class TowelInfoViewModel : ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    private let networkService = NetworkService()
    
    @Published var loginReponse: LoginReponse? = nil
    @Published var profile: UserResponse? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    let coreData = CoreDataManager.coreDataManager
    @Published var towelInfoList: [TowelInfo] = []
    @Inject var towelRepo : TowelInfoRepo
    
    init() {
        
         fetchInfo()
        //getTowelInfo()
    }
    
    func fetchInfo() {
        do {
            var result =  towelRepo.getTowelInfo()
            towelInfoList = try result.get() //?? []
        }catch let error{
            print("Fetch error \(error)")
        }
        
    }
    
    func getTowelInfo(){
        let request = NSFetchRequest<TowelInfo>(entityName: "TowelInfo")
        do {
            towelInfoList = try coreData.context.fetch(request)
        }
        catch let error {
            print("Fetch error \(error)")
        }
        
    }
    
    func addType(name : String){
        let sizeItem = TowelInfo(context: coreData.context)
        sizeItem.name = name
        sizeItem.id = UUID()
        sizeItem.created_at = Date()
        sizeItem.updated_at = Date()
        coreData.save()
        towelInfoList = []
        getTowelInfo()
    }
    
    func updateSize(name : String,info: TowelInfo){
        let sizeItem = info
        sizeItem.name = name
        sizeItem.updated_at = Date()
        coreData.save()
        towelInfoList = []
        getTowelInfo()
    }
    func deleteType(_ item: NSManagedObject?){
        guard item != nil else {return}
        coreData.context.delete(item!)
        coreData.save()
        getTowelInfo()
    }
    
    
    func fetchProfile () {
            isLoading = true
            errorMessage = nil
            
        networkService.get(urlString: "https://gastro-guru.mizsol.com/public/api/user/profile", responseType: GeneralReponse<UserResponse>.self)
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    self.isLoading = false
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                        print("Error fetching profile: \(error)")
                    }
                }, receiveValue: { posts in
                    self.profile = posts.data
                    print(posts.data)
                })
                .store(in: &self.cancellables)
        }
    
    
    
    func login(username: String, password: String) {
            isLoading = true
            errorMessage = nil
            
            let request = LoginRequest(email: username, password: password)
            guard let url = URL(string: "https://gastro-guru.mizsol.com/public/api/login") else {
                self.errorMessage = "Invalid URL"
                self.isLoading = false
                return
            }
            
            networkService.post(url: url, body: request, responseType: GeneralReponse<LoginReponse>.self)
                .receive(on: DispatchQueue.main) // Ensure we receive on the main thread
                .sink(receiveCompletion: { completion in
                    self.isLoading = false
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.errorMessage = error.localizedDescription
                    }
                }, receiveValue: { response in
                    self.loginReponse = response.data
                    saveToKeychain(value: response.data?.token ?? "", forKey: "accessToken")
                    // UserDefaults.standard.set(response.data?.token, forKey: "accessToken")
                    print(self.loginReponse ?? "No data found")
                    //self.token = response.token
                })
                .store(in: &cancellables)
        }
}
