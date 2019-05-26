using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using libComunes.CapaDatos;

namespace libClases_DS.Informes
{
    public class DevolucionCTRL
    {
        #region Atributos/Propiedades
        private string SQL;
        public string error { get; private set; }
        public Int32 reservaCodigo { get; set; }
        public Int32 kmFinal { get; set; }
        public Int32 multa { get; set; }
        public string descripcion { get; set; }

        #endregion

        #region Metodos
        public bool Ingresar()
        {
            SQL = "SP_Devolver_Vehiculo";
            clsConexion oConexion = new clsConexion();
            oConexion.SQL = SQL;
            oConexion.AgregarParametro("@ReservaId", System.Data.SqlDbType.BigInt, 8, reservaCodigo);
            oConexion.AgregarParametro("@KMDespues", System.Data.SqlDbType.Int, 8, kmFinal);
            oConexion.AgregarParametro("@Observaciones", System.Data.SqlDbType.VarChar, 300, descripcion);
            oConexion.AgregarParametro("@Multa", System.Data.SqlDbType.Int, 8, multa);
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
