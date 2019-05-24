<%@ Page Title="" Language="C#" MasterPageFile="~/MenuOpciones.Master" AutoEventWireup="true" CodeBehind="VehiculosFRM.aspx.cs" Inherits="SitioWEB.Informes.VehiculosFRM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Informe de Vehiculos</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="col-11">
                <h1 style="text-align: center"> Informe de vehículos. </h1>
            </div>
                    <div class="row">
                        <div class="col-11">
                            <asp:LinkButton ID="btnGenerarInformeVehiculos" CssClass="btn btn-block btn-secondary" runat="server" OnClick="btnGenerarInformeVehiculos_Click"><i class="fas fa-list-alt mr-2"></i>Generar informe de vehiculos</asp:LinkButton>
                            <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger text-center d-block"></asp:Label>
                            <div class="row mt-3 justify-content-around">
                                <div class="col-5">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text" for="ddlOrdenar"><i class="fas fa-filter mr-2"></i> Filtrar por: </label>
                                        </div>
                                        <asp:DropDownList ID="ddlOrdenar" CssClass="custom-select" runat="server" OnSelectedIndexChanged="ddlOrdenar_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem Value="0">Seleccione el criterio para filtrar</asp:ListItem>
                                            <asp:ListItem Value="1">Color</asp:ListItem>
                                            <asp:ListItem Value="2">Estado</asp:ListItem>
                                            <asp:ListItem Value="3">Marca</asp:ListItem>
                                            <asp:ListItem Value="4">Tipo</asp:ListItem>
                                            <asp:ListItem Value="5">Gama</asp:ListItem>
                                            <asp:ListItem Value="6">Modelo</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-5">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text" for="ddlOrdenar">Seleccione</label>
                                        </div>
                                        <asp:DropDownList ID="ddlValorCriterio" CssClass="custom-select" runat="server" OnSelectedIndexChanged="ddlValorCriterio_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-11">
                            <asp:GridView ID="grdInformeVehiculos" runat="server" CssClass="table table-borderless table-secondary text-center mt-2"> 
                                <HeaderStyle CssClass="thead-secondary" />
                            </asp:GridView>
                        </div>
                    </div>
 
        </div>
    </div>
</asp:Content>
