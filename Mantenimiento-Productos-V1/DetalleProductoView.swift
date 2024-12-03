//
//  DetalleProductoView.swift
//  Mantenimiento-Productos-V1
//
//  Created by DAMII on 2/12/24.
//

import SwiftUI

struct DetalleProductoView: View {
    var categoria: Categoria
    var producto: Producto
    @ObservedObject var modelo: ModeloCategorias
    @State private var nombre: String = ""
    @State private var descripcion: String = ""
    @State private var activo: Bool = false
    
    var body: some View {
        Form {
            TextField("Ingresar nombre", text: $nombre)
            TextField("Ingresar descripción", text: $descripcion)
            Button(activo ? "Activo" : "Inactivo") {
                activo.toggle()
            }
            .padding(8)
            .foregroundColor(.white)
            .background(activo ? .green : .gray)
            .cornerRadius(8)
            Button("Guardar") {
                if let index1 = modelo.categorias.firstIndex(where: { $0.id == categoria.id }) {
                    if let index2 = modelo.categorias[index1].productos.firstIndex(where: { $0.id == producto.id }) {
                        var editado = modelo.categorias[index1].productos[index2]
                        editado.nombre = nombre.trimmingCharacters(in: .whitespacesAndNewlines)
                        editado.descripcion = descripcion.trimmingCharacters(in: .whitespacesAndNewlines)
                        editado.activo = activo
                        modelo.categorias[index1].productos[index2] = editado
                    }
                }
            }
            .disabled(nombre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || descripcion.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .navigationTitle("Detalles Producto")
        .onAppear {
            nombre = producto.nombre
            descripcion = producto.descripcion
            activo = producto.activo
        }
    }
}
