//
//  extensionController.swift
//  UserRegisterTable
//
//  Created by Admin on 11/2/20.
//

import Foundation
import UIKit

struct Person {
    var name: String
    var id: String
    var salary: String
    var age: String
    
}

extension UIFont {

    public enum OpenSansType: String {
        case extraboldItalic = "-ExtraboldItalic"
        case semiboldItalic = "-SemiboldItalic"
        case semibold = "-Semibold"
        case regular = ""
        case lightItalic = "Light-Italic"
        case light = "-Light"
        case italic = "-Italic"
        case extraBold = "-Extrabold"
        case boldItalic = "-BoldItalic"
        case bold = "-Bold"
    }

    static func OpenSans(_ type: OpenSansType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "OpenSans\(type.rawValue)", size: size)!
    }

    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }

    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }

}

//MARK: - TextFiled Validation
class Validation {
   public func validateName(name: String) ->Bool {
      // Length be 18 characters max and 3 characters minimum, you can always modify.
      let nameRegex = "^\\w{3,18}$"
      let trimmedString = name.trimmingCharacters(in: .whitespaces)
      let validateName = NSPredicate(format: "SELF MATCHES %@", nameRegex)
      let isValidateName = validateName.evaluate(with: trimmedString)
      return isValidateName
   }
   public func validaPhoneNumber(phoneNumber: String) -> Bool {
      let phoneNumberRegex = "^[6-9]\\d{9}$"
      let trimmedString = phoneNumber.trimmingCharacters(in: .whitespaces)
      let validatePhone = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
      let isValidPhone = validatePhone.evaluate(with: trimmedString)
      return isValidPhone
   }
    public func validaSalary(Salary: String) -> Bool {
       let SalaryRegex = "^[0-9]\\w{1,18}$"
       let trimmedString = Salary.trimmingCharacters(in: .whitespaces)
       let validateSalary = NSPredicate(format: "SELF MATCHES %@", SalaryRegex)
       let isValidSalary = validateSalary.evaluate(with: trimmedString)
       return isValidSalary
    }
    public func validaAge(Age: String) -> Bool {
       let AgeRegex = "^[0-9]\\w{1,18}$"
       let trimmedString = Age.trimmingCharacters(in: .whitespaces)
       let validateAge = NSPredicate(format: "SELF MATCHES %@", AgeRegex)
       let isValidAge = validateAge.evaluate(with: trimmedString)
       return isValidAge
    }
   public func validateEmailId(emailID: String) -> Bool {
      let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
      let trimmedString = emailID.trimmingCharacters(in: .whitespaces)
      let validateEmail = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
      let isValidateEmail = validateEmail.evaluate(with: trimmedString)
      return isValidateEmail
   }
   public func validatePassword(password: String) -> Bool {
      //Minimum 8 characters at least 1 Alphabet and 1 Number:
      let passRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
      let trimmedString = password.trimmingCharacters(in: .whitespaces)
      let validatePassord = NSPredicate(format:"SELF MATCHES %@", passRegEx)
      let isvalidatePass = validatePassord.evaluate(with: trimmedString)
      return isvalidatePass
   }
   public func validateAnyOtherTextField(otherField: String) -> Bool {
      let otherRegexString = "Your regex String"
      let trimmedString = otherField.trimmingCharacters(in: .whitespaces)
      let validateOtherString = NSPredicate(format: "SELF MATCHES %@", otherRegexString)
      let isValidateOtherString = validateOtherString.evaluate(with: trimmedString)
      return isValidateOtherString
   }
}
