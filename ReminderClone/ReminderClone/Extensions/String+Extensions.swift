//
//  String+Extensions.swift
//  ReminderClone
//
//  Created by Lê Minh Hiếu on 12/1/26.
//

import Foundation

extension String {
    var isEmptyOrWhitespace: Bool {
        return trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
