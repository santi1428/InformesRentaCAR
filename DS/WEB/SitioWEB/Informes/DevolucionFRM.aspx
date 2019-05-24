<%@ Page Language="C#" MasterPageFile="~/MenuOpciones.Master" AutoEventWireup="true" CodeBehind="DevolucionFRM.aspx.cs" Inherits="SitioWEB.Informes.DevolucionFRM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Realizar reserva</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-12">
            <div class="col-11">
                <h1 style="text-align: center"> Devolver vehículo. </h1>
            </div>
                    <div class="row">
                        <div class="col-11">
                          <asp:LinkButton ID="btnDevolverVehiculo" CssClass="btn btn-block btn-secondary" runat="server"><i class="fas fa-list-alt mr-2"></i>Devolver Vehículo</asp:LinkButton>
                            <asp:Label ID="lblError" runat="server" Text="" CssClass="text-danger text-center d-block"></asp:Label>
                            <div class="row mt-3 justify-content-around">
                                <div class="col-4">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text"><i class="fas fa-code mr-2"></i> Código de Reserva: </label>
                                        </div>
                                        <asp:TextBox ID="TextCodReserva" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text" id="lblFechaFIn"><i class="fas fa-car mr-2"></i></i> Kilometraje Final</label>
                                        </div>
                                        <asp:TextBox ID="TextKmFInal" runat="server" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text" ><i class="fas fa-clock mr-2"></i> Fecha de Entrega: </label>
                                        </div>
                                        <asp:TextBox ID="TextFechaActual" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-8">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text" ><i class="fas fa-file-alt mr-2"></i> Descripcion entrega: </label>
                                        </div>
                                        <asp:TextBox ID="TextDescripcion" runat="server" Width="71%"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-4">
                                    <div class="input-group mb-3">
                                        <div class="input-group-prepend">
                                            <label class="input-group-text" ><i class="fas fa-money-bill-alt mr-2"></i> Multa: </label>
                                        </div>
                                        <asp:TextBox ID="TextMulta" runat="server" TextMode="Number" Width="250px"></asp:TextBox>
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
