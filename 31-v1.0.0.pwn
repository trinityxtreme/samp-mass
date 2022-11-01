
//============================================================================//
//                         31 sistemi - Version 1.0.0                         //
//                           Developed by SkyChord                            //
//============================================================================//
/*

 _|_|_|            _|    _|      _|            _|
   _|    _|_|_|        _|_|_|_|        _|_|_|  _|
   _|    _|    _|  _|    _|      _|  _|    _|  _|
   _|    _|    _|  _|    _|      _|  _|    _|  _|
 _|_|_|  _|    _|  _|      _|_|  _|    _|_|_|  _|


                   _|_|_|                      _|              _|
                 _|          _|_|_|  _|  _|_|      _|_|_|    _|_|_|_|    _|_|_|
                   _|_|    _|        _|_|      _|  _|    _|    _|      _|_|
                       _|  _|        _|        _|  _|    _|    _|          _|_|
                 _|_|_|      _|_|_|  _|        _|  _|_|_|        _|_|  _|_|_|
                                                   _|
                                                   _|

*/
//============================================================================//
//                                      Copyright (c) 2013 - Initial Scripts  //
//============================================================================//

// ========================(( #K�t�phaneler ))=============================== //
#include <a_samp>  // - SA:MP Include | 0.3x | Developed by SA:MP Team

// =========================(( #De�i�kenler ))=============================== //
#define FILTERSCRIPT // - Filterscript tan�t�m�.

// - Sistem mesajlar�:
#define MASS_CONSOLE(%0) printf("[31 SYSTEM]: "%0)
#define MASS_BILGI(%0,%1) SendClientMessage(%0,0xFF0000,"{#2F2F2F}[ {#4A627F}B�LG� {#2F2F2F}]: {4A627F}" %1)
#define MASS_31_KULLANIM(%0) SendClientMessage(%0,0xFF0000,"{#2F2F2F}[ {#841594}KULLANIM {#2F2F2F}]: {841594}/31 {#2F2F2F}[{#841594}cek{#2F2F2F}/{#841594}birak{#2F2F2F}/{#841594}yardim{#2F2F2F}]")
#define MASS_FER_KULLANIM(%0) SendClientMessage(%0,0xFF0000,"{#2F2F2F}[ {#841594}KULLANIM {#2F2F2F}]: {841594}/fermuar {#2F2F2F}[{#841594}ac{#2F2F2F}/{#841594}kapat{#2F2F2F}]")

// - Tan�t�mlar:
new MASSFERMUAR[MAX_PLAYERS] = 0;
new MASSCEKIYOR[MAX_PLAYERS] = 0;
new MASSEREKSIYON[MAX_PLAYERS] = 0;

// ===========================(( #Public ))================================== //
#if defined FILTERSCRIPT

public OnFilterScriptInit()
{
	MASS_CONSOLE("====================================");
	MASS_CONSOLE("         31 System - v1.0.0         ");
	MASS_CONSOLE("        Developed by SkyChord       ");
	MASS_CONSOLE("Copyright (c) 2013 - Initial Scripts");
	MASS_CONSOLE("====================================");
	MASS_CONSOLE("31 sistemi ba�ar�yla ba�lat�ld�.");
	return 1;
}

public OnFilterScriptExit()
{
	MASS_CONSOLE("====================================");
	MASS_CONSOLE("         31 System - v1.0.0         ");
	MASS_CONSOLE("        Developed by SkyChord       ");
	MASS_CONSOLE("Copyright (c) 2013 - Initial Scripts");
	MASS_CONSOLE("====================================");
	MASS_CONSOLE("31 sistemi ba�ar�yla kapat�ld�.");
	return 1;
}

#else

main()
{
	MASS_CONSOLE("====================================");
	MASS_CONSOLE("         31 System - v1.0.0         ");
	MASS_CONSOLE("        Developed by SkyChord       ");
	MASS_CONSOLE("Copyright (c) 2013 - Initial Scripts");
	MASS_CONSOLE("====================================");
	MASS_CONSOLE("31 sistemi ba�ar�yla ba�lat�ld�.");
}

#endif

public OnPlayerConnect(playerid)
{
	// - S�f�rlamalar.
	MASSFERMUAR[playerid] = 0;
	MASSCEKIYOR[playerid] = 0;
	MASSEREKSIYON[playerid] = 0;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	// - S�f�rlamalar.
	MASSFERMUAR[playerid] = 0;
	MASSCEKIYOR[playerid] = 0;
	MASSEREKSIYON[playerid] = 0;
	return 1;
}

public OnPlayerSpawn(playerid)
{
	// - S�f�rlamalar.
	MASSFERMUAR[playerid] = 0;
	MASSCEKIYOR[playerid] = 0;
	MASSEREKSIYON[playerid] = 0;
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(MASSCEKIYOR[playerid] == 1) return MASS_BILGI(playerid,"�ld���n�z i�in mast�rbasyonunuz sona erdi.");
	// - S�f�rlamalar.
	MASSFERMUAR[playerid] = 0;
	MASSCEKIYOR[playerid] = 0;
	MASSEREKSIYON[playerid] = 0;
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256],idx;
	cmd=strtok(cmdtext,idx);
	
	if(!strcmp(cmd,"/fermuar",true))
	{
        new tmp[256];
	    tmp=strtok(cmdtext,idx);
	    if(!strlen(tmp)) return MASS_FER_KULLANIM(playerid);
	    
		if(!strcmp("ac",tmp,true))
		{
		if(MASSFERMUAR[playerid] != 0) return MASS_BILGI(playerid,"Fermuar�n�z zaten a��k!");
		
		MASSFERMUAR[playerid] = 1;
		MASS_BILGI(playerid,"Fermuar�n�z� a�t�n�z!");
		}
 		if(!strcmp("kapat",tmp,true))
		{
		if(MASSFERMUAR[playerid] != 1) return MASS_BILGI(playerid,"Fermuar�n�z zaten kapal�!");
		
		MASSFERMUAR[playerid] = 0;
		MASS_BILGI(playerid,"Fermuar�n�z� kapatt�n�z!");
		}
	}
	
	if(!strcmp(cmd,"/31",true))
	{
	    new tmp[256];
	    tmp=strtok(cmdtext,idx);
	    if(!strlen(tmp)) return MASS_31_KULLANIM(playerid);

		if(!strcmp("cek",tmp,true))
		{
		if(MASSFERMUAR[playerid] != 1) return MASS_BILGI(playerid,"Fermuar�n�z� a�madan �ekemezsiniz!");
		if(MASSCEKIYOR[playerid] != 0) return MASS_BILGI(playerid,"Zaten mast�rbasyon �ekiyorsunuz!");
		
		MASS_BILGI(playerid,"Mast�rbasyon �ekilmeye ba�land�.");
		MASSCEKIYOR[playerid] = 1;
		ApplyAnimation(playerid, "OTB", "wtchrace_win",4.1,0,1,1,0,3300);
		}

		if(!strcmp("birak",tmp,true))
		{
		if(MASSCEKIYOR[playerid] != 1) return MASS_BILGI(playerid,"Zaten mast�rbasyon �ekmiyorsunuz!");
		
		MASS_BILGI(playerid,"Mast�rbasyon b�rak�ld�.");
		MASSCEKIYOR[playerid] = 0;
		
		if(MASSEREKSIYON[playerid] == 1)
		{
		MASS_BILGI(playerid,"1 dakika boyunca ereksiyon halinde olacaks�n�z.");
		} else {
		MASS_BILGI(playerid,"�imdi {FFFFFF}/fermuarkapat {4A627F}yaz�p penisinizi g�r�nmez hale getirebilirsiniz!");
		}
		}
	}
	return 0;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

// ============================(( #Di�er ))================================== //

// - strtok | Developed by SA:MP Team
strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

//============================================================================//
//                              SkyChord Scripts                              //
//                          - 31 S�STEM� / v1.0.0 -                           //

//                           - S�STEM A�IKLAMASI -                            //
/* Merhaba arkada�lar, bu sistemi uzun zamand�r d���n�yordum, yapmak i�in
sonunda vakit buldum ve sizin i�in uygun hale getirdim. Umar�m be�enirsiniz.
*/
//                          - S�STEM �ZELL�KLER� -                            //
/*
- Komutlar:

> /31 cek           ==    Mast�rbasyona ba�lars�n�z.
> /31 birak         ==    As�lmay� b�rak�rs�n�z.
> /31 yardim        ==    Komutlar hakk�nda bilgi sayfas� a��l�r.
> /fermuar ac       ==    Fermuar� a�ar, 31 �ekmeden �nce gerekli.
> /fermuar kapat    ==    Bu komutla penisinizi gizleyebilirsiniz.

- �zellikler:

-> Fermuar a�t���n�zda penis objesi belirir.
+> Fermuar a�madan 31 �ekemezsiniz.
+> �ekmeye ba�lad���n�zda animasyon ba�lar.
-> �ekmeye ba�lad�ktan bir s�re sonra ereksiyon haline ge�ersiniz.
-> �ekmeye ba�lad�ktan 3 dakika sonra bo�al�rs�n�z. (Ayarlanabilir.)
-> Bo�ald�ktan sonra 5 dakika boyunca 31 �ekemezsiniz. (Ayarlanabilir.)
-> Bo�al�rken k�sa bir s�reli�ine obje ��kar.
-> �ekmeyi b�rakt���n�zda ereksiyon halindeyken normal haline gelir.
Normal halindeyken �ylece kal�r.
-> Fermuar kapatt���n�zda obje (yani penisiniz) kaybolur.

*/
//============================================================================//

