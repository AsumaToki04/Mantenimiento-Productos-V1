//
//  Categoria.swift
//  Mantenimiento-Productos-V1
//
//  Created by DAMII on 2/12/24.
//

import SwiftUI

struct Categoria: Identifiable, Codable {
    let id: UUID
    var nombre: String
    var productos: [Producto]
    
    init(id: UUID = UUID(), nombre: String, productos: [Producto] = []) {
        self.id = id
        self.nombre = nombre
        self.productos = productos
    }
}
