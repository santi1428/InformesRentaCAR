using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using libComunes.CapaObjetos;
using libComunes.CapaDatos;

namespace libClases_DS.Informes
{
    public class ReservaCTRL
    {
        #region Atributos/Propiedades
        private string SQL;
        public GridView grdReservas { get; set; }
        public string error { get; private set; }
        public Int32 codigo { get; set; }
        public string fechaInicial { get; set; }
        public string fechaFinal { get; set; }
        public string gama { get; set; }
        public string documentoCliente { get; set; }
        public string matriculaVehiculo { get; set; }

        #endregion

        #region Metodos
        public bool LlenarGridPorCriterio()
        {
            if (grdReservas == null)
            {
                error = "No definió el grid de reservas";
                return false;

            }
            SQL = "SP_Consultar_ReservaXCodigo";
            clsGrid oGrid = new clsGrid();
            oGrid.SQL = SQL;
            oGrid.gridGenerico = grdReservas;
            oGrid.AgregarParametro("@Codigo", codigo);
            oGrid.StoredProcedure = true;
            if (oGrid.LlenarGridWeb())
            {
                grdReservas = oGrid.gridGenerico;
                oGrid = null;
                return true;
            }
            else
            {
                error = oGrid.Error;
                oGrid = null;
                return false;
            }
        }

        public bool Ingresar()
        {
            SQL = "SP_Reserva_Insert";
            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@DocumentoCliente", System.Data.SqlDbType.VarChar, 50, documentoCliente);
            oConexion.AgregarParametro("@FechaInicial", System.Data.SqlDbType.VarChar, 20, fechaInicial);
            oConexion.AgregarParametro("@FechaFinal", System.Data.SqlDbType.VarChar, 20, fechaFinal);
            oConexion.AgregarParametro("@MatriculaVehiculo", System.Data.SqlDbType.VarChar, 50, matriculaVehiculo);
            oConexion.StoredProcedure = true;
            if (oConexion.EjecutarSentencia())
            {
                oConexion = null;
                return true;
            }
            else
            {
                error = oConexion.Error;
                oConexion = null;
                return false;
            }
        }
        #endregion

    }
}
