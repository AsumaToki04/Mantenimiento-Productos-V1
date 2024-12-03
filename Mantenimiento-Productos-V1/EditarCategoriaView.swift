//
//  EditarCategoriaView.swift
//  Mantenimiento-Productos-V1
//
//  Created by DAMII on 2/12/24.
//

import SwiftUI

struct EditarCategoriaView: View {
    var categoria: Categoria
    @ObservedObject var modelo: ModeloCategorias
    @Binding var mostrar: Bool
    @State private var nombre: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Ingresar nombre", text: $nombre)
                Button("Guardar") {
                    if let index = modelo.categorias.firstIndex(where: {
                        $0.id == categoria.id
                    }) {
                        modelo.categorias[index].nombre = nombre
                        mostrar = false
                    }
                }
                .disabled(nombre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
            }
            .navigationTitle("Editar Categoría")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("< Cancelar") {
                        mostrar = false
                    }
                }
            }
        }
        .onAppear {
            nombre = categoria.nombre
        }
    }
}
