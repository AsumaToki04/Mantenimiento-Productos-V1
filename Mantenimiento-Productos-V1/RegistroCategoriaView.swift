//
//  RegistroCategoriaView.swift
//  Mantenimiento-Productos-V1
//
//  Created by DAMII on 2/12/24.
//

import SwiftUI

struct RegistroCategoriaView: View {
    @ObservedObject var modelo: ModeloCategorias
    @Binding var mostrar: Bool
    @State private var nombre: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Ingresar nombre", text: $nombre)
                Button("Guardar") {
                    let nuevo = Categoria(nombre: nombre.trimmingCharacters(in: .whitespacesAndNewlines))
                    modelo.categorias.append(nuevo)
                    mostrar = false
                }
                .disabled(nombre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty )
            }
            .navigationTitle("Registro de Categoría")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("< Cancelar") {
                        mostrar = false
                    }
                }
            }
        }
    }
}
