//
//  ListaCategoriasView.swift
//  Mantenimiento-Productos-V1
//
//  Created by DAMII on 2/12/24.
//

import SwiftUI

struct ListaCategoriasView: View {
    @ObservedObject var modelo: ModeloCategorias
    @State private var mostrarRegistro = false
    
    var body: some View {
        VStack {
            List {
                ForEach(modelo.categorias) { item in
                    NavigationLink(
                        destination: ListaProductosView(categoria: item, modelo: modelo)
                    ) {
                        VStack(alignment: .leading) {
                            Text(item.nombre)
                                .font(.headline)
                            Text("Productos: \(item.productos.count)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete { i in
                    modelo.categorias.remove(atOffsets: i)
                }
            }
        }
        .navigationTitle("Lista de Categorías")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    mostrarRegistro = true
                }) {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $mostrarRegistro) {
            RegistroCategoriaView(modelo: modelo, mostrar: $mostrarRegistro)
        }
    }
}
