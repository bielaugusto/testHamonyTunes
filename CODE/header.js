var headerContent = `
<!--Cabeçalho nav-->
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
      <div class="container-fluid px-5 py-2">
        <a href="index.html"><img class="rounded-2" src="../IMGS/logo.png" width="40px"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse mx-3 p-1 end-0" id="navbarTogglerDemo02">
            <div class="form d-block">
                <form class="flex-grow-1 d-flex mx-3 my-2" role="search">
                    <input class="form-control me-2 flex-grow-1" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn btn-outline-dark" type="submit">Search</button>
                </form>
            </div>
            <div class="btns position-absolute end-0">
                <ul class="navbar-nav me-auto mb-2 px-4 mb-lg-0">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="index.html">Home</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="sobre.html">Sobre</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">Shop</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="login.html">Sign in</a>
                    </li>
                    <button type="button" class="btn btn-dark d-none d-lg-block">Meu Carrinho</button>
                    <button type="button" class="btn btn-dark d-block d-lg-none">Carrinho</button>
        
                  </ul>
            </div>
        </div>
      </div>
    </nav>
`

var header = document.getElementById("header");
header.innerHTML = headerContent;
