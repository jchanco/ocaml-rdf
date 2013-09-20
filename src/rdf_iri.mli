(*********************************************************************************)
(*                OCaml-RDF                                                      *)
(*                                                                               *)
(*    Copyright (C) 2012-2013 Institut National de Recherche en Informatique     *)
(*    et en Automatique. All rights reserved.                                    *)
(*                                                                               *)
(*    This program is free software; you can redistribute it and/or modify       *)
(*    it under the terms of the GNU Lesser General Public License version        *)
(*    3 as published by the Free Software Foundation.                            *)
(*                                                                               *)
(*    This program is distributed in the hope that it will be useful,            *)
(*    but WITHOUT ANY WARRANTY; without even the implied warranty of             *)
(*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the              *)
(*    GNU General Public License for more details.                               *)
(*                                                                               *)
(*    You should have received a copy of the GNU General Public License          *)
(*    along with this program; if not, write to the Free Software                *)
(*    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA                   *)
(*    02111-1307  USA                                                            *)
(*                                                                               *)
(*    Contact: Maxence.Guesdon@inria.fr                                          *)
(*                                                                               *)
(*********************************************************************************)

(** IRIs. *)


(** IRIs are abstract. {b Do not compare with generic comparison
  functions} ([Pervasives.compare], (=), ...). Use {!equal} or {!compare}. *)
type iri

(** When the IRI is parsed, this
  [Invalid_iri (string, message) is raised if the
  given string is invalid, with an additional message. *)
exception Invalid_iri of string * string

(** Create a string from an IRI. *)
val string : iri -> string

(** Create an IRI from a string.
   @raise Invalid_iri in case the string does not represent a valid IRI.
   @param check can be specified to [false] to prevent IRI parsing.
   Parsing will be done later if needed, and may then raise [Invalid_iri].
*)
val iri : ?check: bool -> string -> iri

(** [to_uri iri] encode the given IRI and try to create an URI.
  May raise [Rdf_uri.Invalid_uri] is the IRI cannot be mapped to
  an URI. *)
val to_uri : iri -> Rdf_uri.uri