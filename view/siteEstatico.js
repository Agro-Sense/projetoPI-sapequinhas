var listaUsuarios = [];
var listaSenhas = [];
var listaEmpresas = [];

function Registrar() {
    var empresa = ipt_Empresa.value;
    var user = ipt_User.value.toLowerCase();
    var senha = ipt_Senha_User.value;
    var msg_erro = "";

    if (empresa == "" || user == "" || senha == "") {
        msg_erro = "<p id='msg_alerta'>Preencha todos os campos!</p><br>";
    } else if (!user.includes('@')) {
        msg_erro = "<p id='msg_alerta'>Usuário deve conter @!</p><br>";
    } else if (senha.length < 8) {
        msg_erro = " <p id='msg_alerta'>Senha deve ter 8+ caracteres!</p><br>";
    }

    if (msg_erro != "") {
        div_msg.innerHTML = msg_erro;
    } else {
        listaUsuarios.push(user);
        listaSenhas.push(senha);
        listaEmpresas.push(empresa);
        console.log(listaUsuarios);

        div_msg.innerHTML = " <p id='msg_alerta'>Cadastro realizado! Agora você pode fazer login.</p>";
        ipt_Empresa.value = "";
        ipt_User.value = "";
        ipt_Senha_User.value = "";
    }
}

function Validar() {
    var userLogin = ipt_Login_User.value.toLowerCase();
    var senhaLogin = ipt_Login_Senha.value;

    var indice = listaUsuarios.indexOf(userLogin);

    if (indice != -1 && listaSenhas[indice] == senhaLogin) {
        div_msg.innerHTML = ` <p id='msg_alerta'>Login realizado! Bem-vindo(a) da empresa</p>  ${listaEmpresas[indice]}`;
    } else {
        div_msg.innerHTML = " <p id='msg_alerta'>Usuário ou senha incorretos!</p>";
    }

   
}

function irLogin() {
 document.getElementById("tela_cadastro").style.display="none";
    document.getElementById("tela_login").style.display="block";
    console.log(listaUsuarios);
}