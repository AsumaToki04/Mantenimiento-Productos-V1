//
//  ListaProductosView.swift
//  Mantenimiento-Productos-V1
//
//  Created by DAMII on 2/12/24.
//

import SwiftUI

struct ListaProductosView: View {
    var categoria: Categoria
    @ObservedObject var modelo: ModeloCategorias
    @State private var mostrarRegistro = false
    @State private var mostrarEditar = false
    
    var body: some View {
        VStack {
            List {
                ForEach(categoria.productos) { item in
                    HStack {
                        NavigationLink(
                            destination: DetalleProductoView(categoria: categoria, producto: item, modelo: modelo)
                        ) {
                        VStack(alignment: .leading) {
                                Text(item.nombre)
                                Text(item.descripcion)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                .onDelete { i in
                    eliminarProducto(offSets: i)
                }
            }
        }
        .navigationTitle(categoria.nombre)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    mostrarRegistro = true
                }) {
                    Image(systemName: "plus")
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    mostrarEditar = true
                }) {
                    Image(systemName: "pencil")
                }
            }
        }
        .sheet(isPresented: $mostrarRegistro) {
            RegistroProductoView(categoria: categoria, modelo: modelo, mostrar: $mostrarRegistro)
        }
        .sheet(isPresented: $mostrarEditar) {
            EditarCategoriaView(categoria: categoria, modelo: modelo, mostrar: $mostrarEditar)
        }
    }
    
    private func eliminarProducto(offSets: IndexSet) {
        if let index1 = modelo.categorias.firstIndex(where: { $0.id == categoria.id }) {
            modelo.categorias[index1].productos.remove(atOffsets: offSets)
        }
    }
}
