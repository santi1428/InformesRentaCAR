<%@ Page Title="" Language="C#" MasterPageFile="~/MenuOpciones.Master" AutoEventWireup="true" CodeBehind="PagosFRM.aspx.cs" Inherits="SitioWEB.Informes.PagosFRM" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="row">
                <div class="col-11">
                    <asp:LinkButton ID="btnGenerarInformePagos" CssClass="btn btn-block btn-secondary" runat="server" OnClick="btnGenerarInformePagos_Click"><i class="fas fa-list-alt mr-2"></i>Generar informe de pagos</asp:LinkButton>
                    <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger text-center d-block"></asp:Label>
                    <div class="row mt-3 justify-content-around">
                        <div class="col-5">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="ddlOrdenar"><i class="fas fa-filter mr-2"></i>Filtrar por: </label>
                                </div>
                                <asp:DropDownList ID="ddlOrdenar" CssClass="custom-select" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlOrdenar_SelectedIndexChanged">
                                    <asp:ListItem Value="0">Seleccione el criterio para filtrar</asp:ListItem>
                                    <asp:ListItem Value="1">Estado</asp:ListItem>
                                    <asp:ListItem Value="2">Aseguradora</asp:ListItem>
                                    <asp:ListItem Value="3">Cliente</asp:ListItem>
                                    <asp:ListItem Value="4">Tipo</asp:ListItem>
                                    <asp:ListItem Value="5">Fecha</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-5">
                            <div class="input-group mb-3">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="ddlOrdenar">Seleccione</label>
                                </div>
                                <asp:DropDownList ID="ddlValorCriterio" CssClass="custom-select" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-4">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <label class="input-group-text" for="ddlOrdenar">Fecha inicial</label>
                                </div>
                                <asp:TextBox ID="txtFechaInicial" runat="server" TextMode="Date" CssClass="form-control" Enabled="False"></asp:TextBox>
                            </div>
                        </div>
                           <div class="col-4 offset-1">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <label class="input-group-text" for="ddlOrdenar">Fecha final</label>
                                    </div>
                                    <asp:TextBox ID="txtFechaFinal" runat="server" TextMode="Date" CssClass="form-control" Enabled="False"></asp:TextBox>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-11">
                    <asp:GridView ID="grdInformePagos" runat="server" CssClass="table table-borderless table-secondary text-center mt-2">
                        <HeaderStyle CssClass="thead-secondary" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
