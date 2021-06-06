package controller;

import dao.AcompanhamentoDao;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.PedidoDao;
import dao.UserDao;
import dao.CartaoDao;
import dao.DespesaDao;
import dao.MarmitaDao;
import java.util.List;
import model.Cartao;
import model.Pedido;

@WebServlet(name = "PedidoController", urlPatterns = {"/PedidoController"})
public class PedidoController extends HttpServlet {
    private final PedidoDao dao;
    private final UserDao udao;
    private final CartaoDao cdao;
    private final MarmitaDao mdao;
    private final AcompanhamentoDao adao;
    private final DespesaDao ddao;
    
    public PedidoController() {
        super();
        dao = new PedidoDao();
        udao = new UserDao();
        cdao = new CartaoDao();
        mdao = new MarmitaDao();
        adao = new AcompanhamentoDao();
        ddao = new DespesaDao();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward="";        
        String action = request.getParameter("action");                                
        
        if (action.equalsIgnoreCase("listPedido")){            
            String cpf = request.getParameter("cpf");
            request.setAttribute("pedidos", dao.getPedidoByCpf(cpf));
            request.setAttribute("cpf", cpf);  
            request.getRequestDispatcher("/listPedido.jsp").forward(request, response);
        } 
        else if (action.equalsIgnoreCase("listallPedidos")){            
            String cpf = request.getParameter("cpf");
            request.setAttribute("pedidos", dao.getAllPedidos());
            request.setAttribute("cpf", cpf);  
            request.getRequestDispatcher("/relatorioPedido.jsp").forward(request, response);
        }
        else if (action.equalsIgnoreCase("atendenteRealizaPedido")){            
            String cpf = request.getParameter("cpf");            
            request.setAttribute("users", udao.getUserById(cpf));
            request.setAttribute("marmitas", mdao.getAllMarmitas());
            request.setAttribute("acomps", adao.getAllAcomps());
            request.setAttribute("cpf", cpf);  
            request.getRequestDispatcher("/atendenteRealizaPedido.jsp").forward(request, response);
        }
        else if (action.equalsIgnoreCase("listPedidosMon")){//MOSTRA OS PEDIDOS MAIS VENDIDOS, MENOS VENDIDOS, CLIENTE QUE MAIS COMPROU, QUE MENOS COMPROU......          
            String cpf = request.getParameter("cpf");
            request.setAttribute("users", udao.getUserById(cpf));
            request.setAttribute("qtdusers", udao.getQtdUsuariosSistema());
            request.setAttribute("qtdpedidos", udao.getQtdPedidosByCliente());
            request.setAttribute("pedidos", dao.getMarmitaMaisVendida());
            request.setAttribute("pedidosmenos", dao.getMarmitaMenosVendida());
            request.setAttribute("totfaturado", dao.getTotalFaturadoByPeriodo());
            request.setAttribute("totdespesas", ddao.getTotalDespesaByPeriodo());
            request.setAttribute("cpf", cpf);  
            request.getRequestDispatcher("/relatorioPedidoMon.jsp").forward(request, response);
        }
        else if (action.equalsIgnoreCase("listallPedidosProducao")){//PEDIDOS PARA O COZINHEIRO PRODUZIR            
            String cpf = request.getParameter("cpf");
            request.setAttribute("pedidos", dao.getAllPedidosProd());
            request.setAttribute("cpf", cpf);  
            request.getRequestDispatcher("/telaPedidosCozinheiro.jsp").forward(request, response);
        }
        else if (action.equalsIgnoreCase("atualizaPedidosProd")){//ATUALIZA OS PEDIDOS QUE FORAM PRODUZIDOS          
            String cpf = request.getParameter("cpf");
            String cd_numeroPedido = request.getParameter("cd_numeroPedido");            
            dao.updateSttsPedidoProd(cd_numeroPedido);
            request.setAttribute("pedidos", dao.getAllPedidosProd());
            request.setAttribute("cpf", cpf);  
            request.getRequestDispatcher("/telaPedidosCozinheiro.jsp").forward(request, response);
        }
        else if (action.equalsIgnoreCase("listallPedidosEntrega")){//PEDIDOS PARA O ENTREGADOR FAZER O DELIVERY            
            String cpf = request.getParameter("cpf");
            request.setAttribute("pedidos", dao.getAllPedidosEntrega());
            request.setAttribute("cpf", cpf);  
            request.getRequestDispatcher("/telaPedidosEntregador.jsp").forward(request, response);
        }
        else if (action.equalsIgnoreCase("atualizaPedidosEntrega")){//ATUALIZA OS PEDIDOS QUE FORAM ENTREGUES          
            String cpf = request.getParameter("cpf");
            String cd_numeroPedido = request.getParameter("cd_numeroPedido");            
            dao.updateSttsPedidoEntrega(cd_numeroPedido);
            request.setAttribute("pedidos", dao.getAllPedidosEntrega());
            request.setAttribute("cpf", cpf);  
            request.getRequestDispatcher("/telaPedidosEntregador.jsp").forward(request, response);
        } 
        else if (action.equalsIgnoreCase("voltarTelaAdm")){//RETORNA TELA ADM        
            String cpf = request.getParameter("cpf");
            System.out.println("CPF que veio la do botao de voltar do listar pedidos: " + cpf);
            request.setAttribute("users", udao.getUserById(cpf));
            request.getRequestDispatcher("/telaAdmin.jsp").forward(request, response);
        } 
        else{/*CASO DE RETORNO À TELA ANTERIOR SEM PERDER OS DADOS*/             
            String cpf = request.getParameter("cpf");
            System.out.println("CPF que veio la do botao de voltar do listar pedidos: " + cpf);
            request.setAttribute("users", udao.getUserById(cpf));
            request.getRequestDispatcher("/telaCliente.jsp").forward(request, response);
        }       
    }
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Pedido pedido = new Pedido();
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));                      
        String tamanho = request.getParameter("tamanho");
        String cd_marmita = request.getParameter("cd_marmita");
        String email = request.getParameter("email");
        Float preco = Float.parseFloat(request.getParameter("preco"));        
        String cpf = request.getParameter("cpf");
        String frmpgmt = request.getParameter("frmpgmt");
        
        pedido.setCpf(cpf);
        pedido.setQtd_marmita(quantidade);
        pedido.setValorPedido(preco);
        
        System.out.println("Quantidade: " + quantidade);
        System.out.println("Tamanho: " + tamanho);
        System.out.println("Codigo da marmita: " + cd_marmita);
        System.out.println("Email: " + email);
        System.out.println("Preço: " + preco);
        System.out.println("CPF: " + cpf);
        System.out.println("Forma de pagamento: " + frmpgmt);        
        
        //VERIFICANDO SE O USUARIO QUE ESTÁ EFETUANDO O PEDIDO, POSSUI CARTAO PARA PAGAR E CONCLUIR O PEDIDO
        if (frmpgmt.equalsIgnoreCase("Dinheiro")){
            dao.addPedido(pedido, cd_marmita);
            request.setAttribute("cpf", cpf);        
            request.setAttribute("users", udao.getUserById(cpf));
            request.setAttribute("mensagem", "Seu Pedido foi registrado!\nO entregador estará munido de troco!");
            request.getRequestDispatcher("/telaCliente.jsp").forward(request, response);
        }
        else{
            dao.addPedido(pedido, cd_marmita);
            request.setAttribute("cpf", cpf);        
            request.setAttribute("users", udao.getUserById(cpf));
            request.setAttribute("mensagem", "Seu Pedido foi registrado!\nO entregador levará a maquininha de cartão para efetuar o pagamento!");
            request.getRequestDispatcher("/telaCliente.jsp").forward(request, response);
        }
        /*
        else{
            List<Cartao> cartoes = cdao.getCartaoByCpf(cpf);
            if (cartoes.isEmpty()){
                request.setAttribute("cpf", cpf);        
                request.setAttribute("users", udao.getUserById(cpf));
                request.setAttribute("naoTemCartao", "Usuario em questão não possui cartao cadastrado!\nFavor cadastrar cartao para efetuar um pedido!");
                request.getRequestDispatcher("/telaCliente.jsp").forward(request, response);     
            }
            else{//DAQUI, DEVERÁ IR À TELA DE PAGAMENTO
                dao.addPedido(pedido, cd_marmita);
                request.setAttribute("cpf", cpf);        
                request.setAttribute("users", udao.getUserById(cpf));
                //request.setAttribute("pedido", dao.getPedidoByCpf(cpf));
                request.setAttribute("pedidos", dao.getPedidoPgmtByCpf(cpf));
                request.setAttribute("cartaouser", cdao.getCartaoByCpf(cpf));
                request.setAttribute("mensagem", "Seu Pedido foi registrado! Consultar na base de dados!");
                System.out.println("Prestes a entrar na telaPagamento");
                request.getRequestDispatcher("/telaPagamento.jsp").forward(request, response); 
                //request.getRequestDispatcher("/telaCliente.jsp").forward(request, response); 
            }
        } 
        */
    }
}
