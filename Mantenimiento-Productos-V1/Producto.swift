//
//  Producto.swift
//  Mantenimiento-Productos-V1
//
//  Created by DAMII on 2/12/24.
//

import SwiftUI

struct Producto: Identifiable, Codable {
    let id: UUID
    var nombre: String
    var descripcion: String
    var activo: Bool
    
    init(id: UUID = UUID(), nombre: String, descripcion: String, activo: Bool = true) {
        self.id = id
        self.nombre = nombre
        self.descripcion = descripcion
        self.activo = activo
    }
}
