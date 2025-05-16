<%@ page import="java.util.*, model.Film" %> 
<%
    String nama = request.getParameter("nama");
    String filmDipilih = request.getParameter("film");
    String jam = request.getParameter("jam");
    int jumlah = Integer.parseInt(request.getParameter("jumlah"));
    List<Film> daftarFilm = (List<Film>) session.getAttribute("daftarFilm");

    int hargaTiket = 0;
    for(Film f : daftarFilm){
        if(f.getJudul().equals(filmDipilih)){
            hargaTiket = f.getHargaTiket();
            break;
        }
    }
    int total = jumlah * hargaTiket;
%>

<!DOCTYPE html>
<html>
<head>
    <title>Struk Pemesanan</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #3e2f2f;
            color: #f5f0e6;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .struk-container {
            background-color: #5c4438;
            padding: 40px;
            border-radius: 15px;
            max-width: 600px;
            margin: 60px auto;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            text-align: center;
        }

        h2 {
            color: #ffe0b3;
            margin-bottom: 30px;
        }

        .label-text {
            color: #ffe0b3;
            font-weight: bold;
        }

        .info-text {
            font-size: 1.1rem;
            margin-bottom: 10px;
        }

        .total-harga {
            font-size: 1.5rem;
            font-weight: bold;
            color: #ffd699;
            margin-top: 20px;
        }

        .barcode {
            margin-top: 30px;
            margin-bottom: 10px;
        }

        .btn-brown {
            background-color: #8b5e3c;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 1rem;
            font-weight: bold;
            border-radius: 10px;
            transition: background-color 0.3s ease;
        }

        .btn-brown:hover {
            background-color: #a76f4d;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="struk-container">
            <h2>Struk Pemesanan</h2>
            <p class="info-text"><span class="label-text">Nama Pemesan:</span> <%= nama %></p>
            <p class="info-text"><span class="label-text">Film:</span> <%= filmDipilih %></p>
            <p class="info-text"><span class="label-text">Jam Tayang:</span> <%= jam %></p>
            <p class="info-text"><span class="label-text">Jumlah Tiket:</span> <%= jumlah %></p>
            <p class="total-harga">Total: Rp <%= total %></p>

            <div class="barcode">
                <img src="https://api.qrserver.com/v1/create-qr-code/?data=<%= nama + "-" + filmDipilih + "-" + jam %>&size=150x150" alt="Barcode Tiket">
            </div>

            <a href="index.jsp" class="btn btn-brown mt-3">Kembali ke Beranda</a>
        </div>
    </div>
</body>
</html>
