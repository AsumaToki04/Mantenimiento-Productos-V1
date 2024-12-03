//
//  RegistroProductoView.swift
//  Mantenimiento-Productos-V1
//
//  Created by DAMII on 2/12/24.
//

import SwiftUI

struct RegistroProductoView: View {
    var categoria: Categoria
    @ObservedObject var modelo: ModeloCategorias
    @Binding var mostrar: Bool
    @State private var nombre: String = ""
    @State private var descripcion: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Ingresar nombre", text: $nombre)
                TextField("Ingresar descripción", text: $descripcion)
                Button("Guardar") {
                    if let index = modelo.categorias.firstIndex(where: {
                        $0.id == categoria.id
                    }) {
                        let nuevo = Producto(nombre: nombre.trimmingCharacters(in: .whitespacesAndNewlines),
                                             descripcion: descripcion.trimmingCharacters(in: .whitespacesAndNewlines))
                        modelo.categorias[index].productos.append(nuevo)
                        mostrar = false
                    }
                }
                .disabled(nombre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty || descripcion.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            .navigationTitle("Registrar Producto")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        mostrar = false
                    }
                }
            }
        }
    }
}
