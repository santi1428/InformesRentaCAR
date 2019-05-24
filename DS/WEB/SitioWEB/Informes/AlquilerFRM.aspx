<%@ Page Title="" Language="C#" MasterPageFile="~/MenuOpciones.Master" AutoEventWireup="true" CodeBehind="AlquilerFRM.aspx.cs" Inherits="SitioWEB.Informes.AlquileresFRM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Alquilar vehículo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="row">
        <div class="col-12">
                    <div class="row">
                        <div class="col-11">
                            <h1 style="text-align: center"> Realizar Alquiler. </h1>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-11">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text"><i class="fas fa-code mr-2"></i> Buscar reserva por código : </label>
                                </div>
                                <asp:TextBox ID="TextCodReserva" runat="server"></asp:TextBox>                                    
                                <asp:Button ID="buscarReserva" class="btn btn-primary" style="margin-left: 10px" runat="server" Text="Buscar" />
                            </div>
                            
                        </div>
                    </div>                    
                    <div class="row">
                        <div class="col-11">
                            <asp:GridView ID="grdInformeAlquileres" runat="server" CssClass="table table-secondary text-center mt-2"> 
                                <HeaderStyle CssClass="thead-secondary" />
                            </asp:GridView>
                        </div>
                    </div>
 
        </div>
    </div>
</asp:Content>
