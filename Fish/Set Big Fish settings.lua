require("nonulualib")
import("System.Windows.Forms")

Clipboard.SetText("zoneId="..Svc.ClientState.TerritoryType..", pos=Vector3("..Player.Entity.Position.X..","..Player.Entity.Position.Y..","..Player.Entity.Position.Z..")")
