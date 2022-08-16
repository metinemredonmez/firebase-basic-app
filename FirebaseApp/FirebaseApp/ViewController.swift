//
//  ViewController.swift
//  FirebaseApp
//
//  Created by Apple on 16.08.2022.
//

import UIKit
import Firebase


class ViewController: UIViewController {

    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //veri kaydı
        ref = Database.database().reference()
        
        // kayıt olsuturacaz database tablo ısmını verelım !
        //ref?.child("test").setValue("Merhaba")
        
        PersonAdd() // ekleme
        PersonDelete() //silme
        PersonUpdate()// guncelleme
        
        AllPerson()//butun hepsini getir
        PersonQueryEqual() // sorgulayarak getir.
        PersonQueryLimit()//limit koyarak getir ! to last to first gibi ilk basındakı sonundakı 

        
    }


    
    func PersonAdd() { // veri kaydı
        
        let newPerson  = Person(perName: "Emre", perAge: 34)
        
        // once nesen sonra dict yapıyoruz  sözlük yapısı bu
        let dict:[String:Any] = ["per_name":newPerson.per_name!,"per_age":newPerson.per_age!]
        
        // şimdi kayıt yapalım
        let referansPerson = ref?.child("Person").childByAutoId()
        
        referansPerson?.setValue(dict)
        
    }
    
    
    func PersonDelete() {
        ref?.child("Person").child("id girilecek").removeValue()
        
    }
    
    func PersonUpdate() {
        
        // guncellemek ıstedıgım szlugu dict yi alıyoruz !
        
        let dict:[String:Any] = ["per_name":"newPerson1","per_age":99]
        
        ref?.child("Person").child("id girilecek").updateChildValues(dict)
    }
    
    
    func AllPerson() {
        // observe ıle gozlemlıyoruz data ıcın observe ile
        
        ref?.child("Person").observe(.value, with: { DataSnapshot in //clousure
            
            
            // BUTUN VERİLER .VALUE AMA DICT DONSUTURMEMIZ LAZIM
            if let getData = DataSnapshot.value as? [String:Any] {
                
                
                // gelen satır satır gelecek buda duzenleyeceğiz
                for getDataColumn in getData {
                    
                    if let dictinory =  getData.values as? NSDictionary  {
                        
                        let key  = getDataColumn.key
                        let per_name = dictinory["per_name"] as? String ?? ""
                        let per_age = dictinory["per_age"] as? Int ?? 0
                        
                        
                        print("key \(key)")
                        print("NAME \(per_name)")
                        print("AGE \(per_age)")
                        print("**********")
                        
                        
                    }
                }
                
            }
            
        })
       
    }
    
    
    
    
    func PersonQueryEqual() {
        // observe ıle gozlemlıyoruz data ıcın observe ile
        // sorgu => person tablosunda per anme de emre yı getır gıbı
        let query = ref?.child("Person").queryOrdered(byChild: "per_name").queryEqual(toValue: "Emre")
        // sorgu yerine
        
        
        query!.observe(.value, with: { DataSnapshot in //clousure
            
            
            // BUTUN VERİLER .VALUE AMA DICT DONSUTURMEMIZ LAZIM
            if let getData = DataSnapshot.value as? [String:Any] {
                
                
                // gelen satır satır gelecek buda duzenleyeceğiz
                for getDataColumn in getData {
                    
                    if let dictinory =  getData.values as? NSDictionary  {
                        
                        let key  = getDataColumn.key
                        let per_name = dictinory["per_name"] as? String ?? ""
                        let per_age = dictinory["per_age"] as? Int ?? 0
                        
                        
                        print("key \(key)")
                        print("NAME \(per_name)")
                        print("AGE \(per_age)")
                        print("**********")
                        
                        
                    }
                }
                
            }
            
        })
       
    }
    
    
    func PersonQueryLimit() {
        // observe ıle gozlemlıyoruz data ıcın observe ile
        // sorgu => person tablosunda per anme de emre yı getır gıbı
        let query = ref?.child("Person").queryLimited(toLast: 1) // bastan veya sonra veri getır 1 tane gıbı
        
        
        query!.observe(.value, with: { DataSnapshot in //clousure
            
            
            // BUTUN VERİLER .VALUE AMA DICT DONSUTURMEMIZ LAZIM
            if let getData = DataSnapshot.value as? [String:Any] {
                
                
                // gelen satır satır gelecek buda duzenleyeceğiz
                for getDataColumn in getData {
                    
                    if let dictinory =  getData.values as? NSDictionary  {
                        
                        let key  = getDataColumn.key
                        let per_name = dictinory["per_name"] as? String ?? ""
                        let per_age = dictinory["per_age"] as? Int ?? 0
                        
                        
                        print("key \(key)")
                        print("NAME \(per_name)")
                        print("AGE \(per_age)")
                        print("**********")
                        
                        
                    }
                }
                
            }
            
        })
       
    }
    
    
}

