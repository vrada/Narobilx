//
//  Slide.swift
//  Narobil
//
//  Created by Dharmendria on 21/01/20.
//  Copyright © 2020 Dharmendria. All rights reserved.
//

import Foundation

struct Slide {
    let imageName: String
    let title: String
    let description: String
    
    static let collection: [Slide] = [
        Slide (imageName: "slide1", title: "Selamat Datang di Narobil", description: "Nikmati layanan membuat tagihan dan event dengan mudah menggunakan Narobil."),
        Slide (imageName: "slide2", title: "Buat Tagihan", description: "Kamu dapat membuat tagihan sendiri atau untuk orang lain dan bagikan."),
        Slide (imageName: "slide3", title: "Buat Event", description: "Buat rencana kegiatan kamu dan bagikan ke semua orang untuk mendaftar."),
        Slide (imageName: "slide4", title: "Laporan", description: "Kamu akan mendapatkan laporan setiap tagihan yang sudah dibayar")
    ]
}
