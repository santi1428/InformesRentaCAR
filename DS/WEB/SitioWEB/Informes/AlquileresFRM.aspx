<%@ Page Title="" Language="C#" MasterPageFile="~/MenuOpciones.Master" AutoEventWireup="true" CodeBehind="AlquileresFRM.aspx.cs" Inherits="SitioWEB.Informes.AlquileresFRM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="row">
        <div class="col-12">
                    <div class="row">
                        <div class="col-11">
                            <asp:LinkButton ID="btnGenerarInformeAlquileres" CssClass="btn btn-secondary btn-block" runat="server" OnClick="btnGenerarInformeAlquileres_Click"><i class="fas fa-list-alt mr-2"></i>Generar informe de alquileres</asp:LinkButton>
                            <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger text-center d-block"></asp:Label>
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
