Attribute VB_Name = "Mod_Declaraciones"
Option Explicit
Public MImana As Integer
Public MIhp As Integer
Public NPChp As Integer
Public NPChpMax As Integer
Public NPCmana As Integer
Public NPCmanamax As Integer
Public MihpMax As Integer
Public MimanaMax As Integer

Public UserCanAttack As Integer

    Public Const DegreeToRadian As Single = 0.01745329251994 'Pi / 180
    Public Const RadianToDegree As Single = 57.2958279087977 '180 / Pi
     
    Public LastTexture As Long
    Public PixelOffsetX As Integer
    Public PixelOffsetY As Integer
    
    Public OffsetCounterX As Integer
    Public OffsetCounterY As Integer
    
Public InvSelectedItemNpc As Long
Public InvSelectedItemUser As Long
Public Body As Integer
Public Actual As Integer
    
'Objetos p�blicos
Public Light As New clsLight
Public Dialogos As New clsDialogs
Public MovEscud As Boolean
Public EstaAtacando As Boolean
Public Audio As New clsAudio
Public CustomKeys As New clsCustomKeys

Public incomingData As New clsByteQueue
Public outgoingData As New clsByteQueue

#If SeguridadAlkon Then
Public MD5 As New clsMD5
#End If

'Sonidos
Public Const SND_CLICK As String = "click.Wav"
Public Const SND_PASOS1 As String = "23.Wav"
Public Const SND_PASOS2 As String = "24.Wav"
Public Const SND_APOCA As String = "27.Wav"
Public Const SND_ROJA As String = "46.Wav"
Public Const SND_INMO As String = "16.Wav"
Public Const SND_MUERE As String = "11.Wav"
Public Const SND_DESC As String = "113.Wav"

Public Const MIdi_Inicio As Byte = 6

Public RawServersList As String

Public Type tColor
    R As Byte
    g As Byte
    b As Byte
End Type

Public ColoresPJ(0 To 50) As tColor


Public Type tServerInfo
    Ip As String
    Puerto As Integer
    desc As String
    PassRecPort As Integer
End Type

Public ServersLst() As tServerInfo
Public ServersRecibidos As Boolean

Public CurServer As Integer

Public CreandoClan As Boolean
Public ClanName As String
Public Site As String

Public UserCiego As Boolean
Public UserEstupido As Boolean

Public NoRes As Boolean 'no cambiar la resolucion

Public RainBufferIndex As Long
Public FogataBufferIndex As Long

Public Const bCabeza = 1
Public Const bPiernaIzquierda = 2
Public Const bPiernaDerecha = 3
Public Const bBrazoDerecho = 4
Public Const bBrazoIzquierdo = 5
Public Const bTorso = 6

'Timers de GetTickCount
Public Const tAt = 2000
Public Const tUs = 600

Public Const PrimerBodyBarco = 84
Public Const UltimoBodyBarco = 87

Public NumEscudosAnims As Integer

Public ArmasHerrero(0 To 100) As Integer
Public ArmadurasHerrero(0 To 100) As Integer
Public ObjCarpintero(0 To 100) As Integer

Public Versiones(1 To 7) As Integer

Public UsaMacro As Boolean
Public CnTd As Byte




'[KEVIN]
Public Const MAX_BANCOINVENTORY_SLOTS As Byte = 40
Public UserBancoInventory(1 To MAX_BANCOINVENTORY_SLOTS) As Inventory
'[/KEVIN]


Public Tips() As String * 255
Public Const LoopAdEternum As Integer = 999

'Direcciones
Public Enum E_Heading
    NORTH = 1
    EAST = 2
    SOUTH = 3
    WEST = 4
End Enum

'Objetos
Public Const MAX_INVENTORY_OBJS As Integer = 10000
Public Const MAX_INVENTORY_SLOTS As Byte = 25
Public Const MAX_NPC_INVENTORY_SLOTS As Byte = 50
Public Const MAXHECHI As Byte = 35

Public Const MAXSKILLPOINTS As Byte = 100

Public Const FLAGORO As Integer = MAX_INVENTORY_SLOTS + 1

Public Const FOgata As Integer = 1521


Public Enum eClass
    Mage = 1    'Mago
    Cleric      'Cl�rigo
    Warrior     'Guerrero
    Assasin     'Asesino
    Thief       'Ladr�n
    Bard        'Bardo
    Druid       'Druida
    Bandit      'Bandido
    Paladin     'Palad�n
    Hunter      'Cazador
    Fisher      'Pescador
    Blacksmith  'Herrero
    Lumberjack  'Le�ador
    Miner       'Minero
    Carpenter   'Carpintero
    Pirat       'Pirata
End Enum

Public Enum eCiudad
    cUllathorpe = 1
    cNix
    cBanderbill
    cLindos
    cArghal
End Enum

Enum eRaza
    Humano = 1
    Elfo
    ElfoOscuro
    Gnomo
    Enano
End Enum

Public Enum eSkill
    Suerte = 1
    Magia = 2
    Robar = 3
    Tacticas = 4
    Armas = 5
    Meditar = 6
    Apu�alar = 7
    Ocultarse = 8
    Supervivencia = 9
    Talar = 10
    Comerciar = 11
    Defensa = 12
    Pesca = 13
    Mineria = 14
    Carpinteria = 15
    Herreria = 16
    Liderazgo = 17
    Domar = 18
    Proyectiles = 19
    Wrestling = 20
    Navegacion = 21
End Enum

Public Enum eAtributos
    Fuerza = 1
    Agilidad = 2
    Inteligencia = 3
    Carisma = 4
    Constitucion = 5
End Enum

Enum eGenero
    Hombre = 1
    Mujer
End Enum

Public Enum PlayerType
    User = &H1
    Consejero = &H2
    SemiDios = &H4
    Dios = &H8
    Admin = &H10
    RoleMaster = &H20
    ChaosCouncil = &H40
    RoyalCouncil = &H80
End Enum

Public Enum eObjType
    otUseOnce = 1
    otWeapon = 2
    otArmadura = 3
    otArboles = 4
    otGuita = 5
    otPuertas = 6
    otContenedores = 7
    otCarteles = 8
    otLlaves = 9
    otForos = 10
    otPociones = 11
    otBebidas = 13
    otLe�a = 14
    otFogata = 15
    otESCUDO = 16
    otCASCO = 17
    otAnillo = 18
    otTeleport = 19
    otYacimiento = 22
    otMinerales = 23
    otPergaminos = 24
    otInstrumentos = 26
    otYunque = 27
    otFragua = 28
    otBarcos = 31
    otFlechas = 32
    otBotellaVacia = 33
    otBotellaLlena = 34
    otManchas = 35          'No se usa
    otCualquiera = 1000
End Enum

Public Const FundirMetal As Integer = 88

'
' Mensajes
'
' MENSAJE_*  --> Mensajes de texto que se muestran en el cuadro de texto
'

Public Const MENSAJE_CRIATURA_FALLA_GOLPE As String = "La criatura fallo el golpe!!!"
Public Const MENSAJE_CRIATURA_MATADO As String = "La criatura te ha matado!!!"
Public Const MENSAJE_RECHAZO_ATAQUE_ESCUDO As String = "Has rechazado el ataque con el escudo!!!"
Public Const MENSAJE_USUARIO_RECHAZO_ATAQUE_ESCUDO  As String = "El usuario rechazo el ataque con su escudo!!!"
Public Const MENSAJE_FALLADO_GOLPE As String = "Has fallado el golpe!!!"
Public Const MENSAJE_SEGURO_ACTIVADO As String = ">>SEGURO ACTIVADO<<"
Public Const MENSAJE_SEGURO_DESACTIVADO As String = ">>SEGURO DESACTIVADO<<"
Public Const MENSAJE_PIERDE_NOBLEZA As String = "��Has perdido puntaje de nobleza y ganado puntaje de criminalidad!! Si sigues ayudando a criminales te convertir�s en uno de ellos y ser�s perseguido por las tropas de las ciudades."
Public Const MENSAJE_USAR_MEDITANDO As String = "�Est�s meditando! Debes dejar de meditar para usar objetos."

Public Const MENSAJE_SEGURO_RESU_ON As String = "SEGURO DE RESURRECCION ACTIVADO"
Public Const MENSAJE_SEGURO_RESU_OFF As String = "SEGURO DE RESURRECCION DESACTIVADO"

Public Const MENSAJE_GOLPE_CABEZA As String = "��La criatura te ha pegado en la cabeza por "
Public Const MENSAJE_GOLPE_BRAZO_IZQ As String = "��La criatura te ha pegado el brazo izquierdo por "
Public Const MENSAJE_GOLPE_BRAZO_DER As String = "��La criatura te ha pegado el brazo derecho por "
Public Const MENSAJE_GOLPE_PIERNA_IZQ As String = "��La criatura te ha pegado la pierna izquierda por "
Public Const MENSAJE_GOLPE_PIERNA_DER As String = "��La criatura te ha pegado la pierna derecha por "
Public Const MENSAJE_GOLPE_TORSO  As String = "��La criatura te ha pegado en el torso por "

' MENSAJE_[12]: Aparecen antes y despues del valor de los mensajes anteriores (MENSAJE_GOLPE_*)
Public Const MENSAJE_1 As String = "��"
Public Const MENSAJE_2 As String = "!!"

Public Const MENSAJE_GOLPE_CRIATURA_1 As String = "��Le has pegado a la criatura por "

Public Const MENSAJE_ATAQUE_FALLO As String = " te ataco y fallo!!"

Public Const MENSAJE_RECIVE_IMPACTO_CABEZA As String = " te ha pegado en la cabeza por "
Public Const MENSAJE_RECIVE_IMPACTO_BRAZO_IZQ As String = " te ha pegado el brazo izquierdo por "
Public Const MENSAJE_RECIVE_IMPACTO_BRAZO_DER As String = " te ha pegado el brazo derecho por "
Public Const MENSAJE_RECIVE_IMPACTO_PIERNA_IZQ As String = " te ha pegado la pierna izquierda por "
Public Const MENSAJE_RECIVE_IMPACTO_PIERNA_DER As String = " te ha pegado la pierna derecha por "
Public Const MENSAJE_RECIVE_IMPACTO_TORSO As String = " te ha pegado en el torso por "

Public Const MENSAJE_PRODUCE_IMPACTO_1 As String = "��Le has pegado a "
Public Const MENSAJE_PRODUCE_IMPACTO_CABEZA As String = " en la cabeza por "
Public Const MENSAJE_PRODUCE_IMPACTO_BRAZO_IZQ As String = " en el brazo izquierdo por "
Public Const MENSAJE_PRODUCE_IMPACTO_BRAZO_DER As String = " en el brazo derecho por "
Public Const MENSAJE_PRODUCE_IMPACTO_PIERNA_IZQ As String = " en la pierna izquierda por "
Public Const MENSAJE_PRODUCE_IMPACTO_PIERNA_DER As String = " en la pierna derecha por "
Public Const MENSAJE_PRODUCE_IMPACTO_TORSO As String = " en el torso por "

Public Const MENSAJE_TRABAJO_MAGIA As String = "Haz click sobre el objetivo..."
Public Const MENSAJE_TRABAJO_PESCA As String = "Haz click sobre el sitio donde quieres pescar..."
Public Const MENSAJE_TRABAJO_ROBAR As String = "Haz click sobre la victima..."
Public Const MENSAJE_TRABAJO_TALAR As String = "Haz click sobre el �rbol..."
Public Const MENSAJE_TRABAJO_MINERIA As String = "Haz click sobre el yacimiento..."
Public Const MENSAJE_TRABAJO_FUNDIRMETAL As String = "Haz click sobre la fragua..."
Public Const MENSAJE_TRABAJO_PROYECTILES As String = "Haz click sobre la victima..."

Public Const MENSAJE_ENTRAR_PARTY_1 As String = "Si deseas entrar en una party con "
Public Const MENSAJE_ENTRAR_PARTY_2 As String = ", escribe /entrarparty"

Public Const MENSAJE_NENE As String = "Cantidad de NPCs: "

'Inventario
Type Inventory
    OBJIndex As Integer
    Name As String
    grhindex As Integer
    '[Alejo]: tipo de datos ahora es Long
    Amount As Long
    '[/Alejo]
    Equipped As Byte
    Valor As Single
    OBJType As Integer
    Def As Integer
    MaxHit As Integer
    MinHit As Integer
End Type

Type NpCinV
    OBJIndex As Integer
    Name As String
    grhindex As Integer
    Amount As Integer
    Valor As Single
    OBJType As Integer
    Def As Integer
    MaxHit As Integer
    MinHit As Integer
    C1 As String
    C2 As String
    C3 As String
    C4 As String
    C5 As String
    C6 As String
    C7 As String
End Type

Type tReputacion 'Fama del usuario
    NobleRep As Long
    BurguesRep As Long
    PlebeRep As Long
    LadronesRep As Long
    BandidoRep As Long
    AsesinoRep As Long
    
    Promedio As Long
End Type

Type tEstadisticasUsu
    CiudadanosMatados As Long
    CriminalesMatados As Long
    UsuariosMatados As Long
    NpcsMatados As Long
    Clase As String
    PenaCarcel As Long
End Type

Public Nombres As Boolean

'User status vars
Global OtroInventario(1 To MAX_INVENTORY_SLOTS) As Inventory

Public UserHechizos(1 To MAXHECHI) As Integer

Public NPCInventory(1 To MAX_NPC_INVENTORY_SLOTS) As NpCinV
Public UserMeditar As Boolean
Public UserName As String
Public UserPassword As String
Public UserMaxHP As Integer
Public UserMinHP As Integer
Public UserMaxMAN As Integer
Public UserMinMAN As Integer
Public UserMaxSTA As Integer
Public UserMinSTA As Integer
Public UserMaxAGU As Byte
Public UserMinAGU As Byte
Public UserMaxHAM As Byte
Public UserMinHAM As Byte
Public UserGLD As Long
Public UserLvl As Integer
Public UserPort As Integer
Public UserServerIP As String
Public UserEstado As Byte '0 = Vivo & 1 = Muerto
Public UserPasarNivel As Long
Public UserExp As Long
Public UserReputacion As tReputacion
Public UserEstadisticas As tEstadisticasUsu
Public UserDescansar As Boolean
Public tipf As String
Public PrimeraVez As Boolean
Public FPSFLAG As Boolean
Public pausa As Boolean
Public IScombate As Boolean
Public UserParalizado As Boolean
Public UserNavegando As Boolean
Public UserHogar As eCiudad
Public UserAvisado As Boolean
'<-------------------------NUEVO-------------------------->
Public Comerciando As Boolean
'<-------------------------NUEVO-------------------------->

Public UserClase As eClass
Public UserSexo As eGenero
Public UserRaza As eRaza
Public UserEmail As String
'Public Actual As Integer


Public Const NUMCIUDADES As Byte = 5
Public Const NUMSKILLS As Byte = 21
Public Const NUMATRIBUTOS As Byte = 5
Public Const NUMCLASES As Byte = 16
Public Const NUMRAZAS As Byte = 5

Public UserSkills(1 To NUMSKILLS) As Byte
Public SkillsNames(1 To NUMSKILLS) As String

Public UserAtributos(1 To NUMATRIBUTOS) As Byte
Public AtributosNames(1 To NUMATRIBUTOS) As String

Public Ciudades(1 To NUMCIUDADES) As String

Public ListaRazas(1 To NUMRAZAS) As String
Public ListaClases(1 To NUMCLASES) As String

Public SkillPoints As Integer
Public Alocados As Integer
Public flags() As Integer
Public Oscuridad As Integer
Public logged As Boolean

Public UsingSkill As Integer

Public MD5HushYo As String * 16

Public pingTime As Long

Public Enum E_MODO
    Normal = 1
    CrearNuevoPj = 2
    Dados = 3
End Enum

Public EstadoLogin As E_MODO
   
Public Enum FxMeditar
    CHICO = 4
    MEDIANO = 5
    GRANDE = 6
    XGRANDE = 16
    XXGRANDE = 34
End Enum

Public Enum eClanType
    ct_RoyalArmy
    ct_Evil
    ct_Neutral
    ct_GM
    ct_Legal
    ct_Criminal
End Enum

Public Enum eEditOptions
    eo_Gold = 1
    eo_Experience
    eo_Body
    eo_Head
    eo_CiticensKilled
    eo_CriminalsKilled
    eo_Level
    eo_Class
    eo_Skills
    eo_SkillPointsLeft
    eo_Nobleza
    eo_Asesino
    eo_Sex
    eo_Raza
End Enum

''
' TRIGGERS
'
' @param NADA nada
' @param BAJOTECHO bajo techo
' @param trigger_2 ???
' @param POSINVALIDA los npcs no pueden pisar tiles con este trigger
' @param ZONASEGURA no se puede robar o pelear desde este trigger
' @param ANTIPIQUETE
' @param ZONAPELEA al pelear en este trigger no se caen las cosas y no cambia el estado de ciuda o crimi
'
Public Enum eTrigger
    NADA = 0
    BAJOTECHO = 1
    trigger_2 = 2
    POSINVALIDA = 3
    ZONASEGURA = 4
    ANTIPIQUETE = 5
    ZONAPELEA = 6
End Enum

'Server stuff
Public RequestPosTimer As Integer 'Used in main loop
Public stxtbuffer As String 'Holds temp raw data from server
Public stxtbuffercmsg As String 'Holds temp raw data from server
Public SendNewChar As Boolean 'Used during login
Public Connected As Boolean 'True when connected to server
Public DownloadingMap As Boolean 'Currently downloading a map from server
Public UserMap As Integer

'Control
Public prgRun As Boolean 'When true the program ends

Public IPdelServidor As String
Public PuertoDelServidor As String

'
'********** FUNCIONES API ***********
'

Public Declare Function GetTickCount Lib "kernel32" () As Long

'para escribir y leer variables
Public Declare Function writeprivateprofilestring Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationname As String, ByVal lpKeyname As Any, ByVal lpString As String, ByVal lpFileName As String) As Long
Public Declare Function getprivateprofilestring Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationname As String, ByVal lpKeyname As Any, ByVal lpdefault As String, ByVal lpreturnedstring As String, ByVal nsize As Long, ByVal lpFileName As String) As Long

'Teclado
Public Declare Function GetKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer
Public Declare Function GetAsyncKeyState Lib "user32" (ByVal nVirtKey As Long) As Integer

Public Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

'Para ejecutar el Internet Explorer para el manual
Public Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

'Lista de cabezas
Public Type tIndiceCabeza
    Head(1 To 4) As Integer
End Type

Public Type tIndiceCuerpo
    Body(1 To 4) As Integer
    HeadOffsetX As Integer
    HeadOffsetY As Integer
End Type

Public Type tIndiceFx
    Animacion As Integer
    OffsetX As Integer
    OffsetY As Integer
End Type


    Public Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
    Public Declare Function SelectObject Lib "gdi32" (ByVal hdc As Long, ByVal hObject As Long) As Long
    Public Declare Function CreateCompatibleDC Lib "gdi32" (ByVal hdc As Long) As Long
    Public Declare Function DeleteDC Lib "gdi32" (ByVal hdc As Long) As Long
    Public Declare Function SetPixel Lib "gdi32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal crColor As Long) As Long


    Public Declare Function timeGetTime Lib "winmm.dll" () As Long
