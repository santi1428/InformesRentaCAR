<%@ Page Language="C#" MasterPageFile="~/MenuOpciones.Master" AutoEventWireup="true" CodeBehind="ReservasFRM.aspx.cs" Inherits="SitioWEB.Informes.ReservasFRM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Realizar reserva</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="col-11">
                <h1 style="text-align: center"> Reservar vehículo. </h1>
            </div>
                    <div class="row justify-content-center">
                        <div class="col-11">
                          <asp:LinkButton ID="btnBuscarVehiculos" CssClass="btn btn-block btn-secondary" runat="server" OnClick="btnBuscarVehiculos_Click"><i class="fas fa-list-alt mr-2"></i>Ver vehículos disponibles</asp:LinkButton>
                            <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger text-center d-block"></asp:Label>
                            <div class="row mt-3 justify-content-around">
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text"><i class="fas fa-calendar mr-2"></i> Fecha Inicial: </label>
                                        </div>
                                        <asp:TextBox ID="txtFechaInicial" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text" id="lblFechaFIn"><i class="fas fa-calendar mr-2"></i>Fecha Final</label>
                                        </div>
                                        <asp:TextBox ID="txtFechaFinal"  CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text" ><i class="fas fa-filter mr-2"></i> Gama: </label>
                                        </div>
                                        <asp:DropDownList ID="ddlGamas" CssClass="custom-select" runat="server" AutoPostBack="true">
                                            <asp:ListItem Value="0">Seleccione la gama</asp:ListItem>
                                            <asp:ListItem Value="Baja">Baja</asp:ListItem>
                                            <asp:ListItem Value="Media">Media</asp:ListItem>
                                            <asp:ListItem Value="Alta">Alta</asp:ListItem>                                            
                                        </asp:DropDownList>
                                    </div>
                                </div>   
 
                            </div>
                            <div class="row mt-3">
                                    <div class="col-4">                                    
                                        <div class="input-group mb-3">
                                            <div class="input-group-prepend">
                                                <label class="input-group-text">Documento Cliente</label>
                                            </div>
                                        <asp:TextBox ID="txtDocumentoCliente" CssClass="form-control" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-11">
                            <asp:GridView ID="grdInformeVehiculos" runat="server" CssClass="table table-borderless table-secondary text-center mt-2" OnSelectedIndexChanged="grdInformeVehiculos_SelectedIndexChanged"> 
                                <Columns>
                                    <asp:CommandField ButtonType="Button" HeaderText="ACCIONES" SelectText="RESERVAR" ShowHeader="True" ShowSelectButton="True">
                                    <ControlStyle BorderStyle="None" CssClass="btn btn-primary btn-block" />
                                    </asp:CommandField>
                                </Columns>
                                <HeaderStyle CssClass="thead-secondary" />
                            </asp:GridView>
                        </div>
                    </div>
 
        </div>
    </div>
</asp:Content>
