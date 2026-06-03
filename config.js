/* =====================================================================
   CONFIGURATION SUPABASE
   ---------------------------------------------------------------------
   Remplace les deux valeurs ci-dessous par celles de TON projet.
   Tu les trouves dans Supabase → Project Settings → Data API :
     - SUPABASE_URL       = "Project URL"
     - SUPABASE_ANON_KEY  = clé "anon / public" (PAS la clé service_role !)

   La clé "anon" est conçue pour être visible côté navigateur : ce qui
   protège réellement tes données, ce sont les règles RLS définies dans
   schema.sql (lecture publique, écriture réservée au gérant connecté).
   ===================================================================== */

const SUPABASE_URL = "https://tmtykunuhflrygbiwzka.supabase.co";
const SUPABASE_ANON_KEY = "sb_publishable_Y-S6kayOP_rjm4EkxuwnuA_NmEl0wtN";
