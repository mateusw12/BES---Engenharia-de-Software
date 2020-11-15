package br.univille.estd.tree;

import java.util.Iterator;

/*
 *  árvore onde os nodos podem ter uma quantidade arbitrária de filhos.
 * */
public class Tree<E> {
	
	private int size;
	private Position<E> root;
	
	/** Retorna a raiz da árvore. */
	public Position<E> root() throws EmptyTreeException{
		return null;
	}
	
	/** Retorna o pai de um dado nodo. */
	public Position<E> parent(Position<E> position) throws  BoundaryViolationException{
		return null;
	}
	
	/** Retorna uma coleção iterável dos filhos de um dado nodo. */
	public Iterator<Position<E>> children(Position<E> position)  throws InvalidPositionException {
		return null;
	}
	
	/** Retorna se um dado nodo é interno. */
	public boolean isInternal(Position<E> position) throws InvalidPositionException  {
		return false;
	}
	
	/** Retorna se um dado nodo é externo. */
	public boolean isExternal(Position<E> position)  throws InvalidPositionException {
		return false;
	}
	
	/** Retorna se um dado nodo é a raiz da árvore. */
	public boolean isRoot(Position<E> position) throws InvalidPositionException   {
		return false;
	}

	/** Retorna a quantidade de nodos da árvore. */
	public int size() {
		return -1;
	}
	
	/** Retorna se a árvore está vazia. */
	public boolean isEmpty() {
		return false;
	}

	/** Retorna uma coleção iterável dos nodos. */
	public Iterator<Position<E>> positions(){
		return null;
	}
	
	/** Substitui o elemento armazenado em um dado nodo. */
	public E replace(Position<E> position, E element) throws InvalidPositionException {
		return null;
	}
	
	/**
	 * Adiciona a raiz em uma árvore vazia
	 * @param element
	 */
	public Position<E> addRoot(E element) throws NonEmptyTreeException {
		return null;
	}
	
	/** Adicione um filho no nodo */
	public Position<E> addChild(Position<E> parent, E element) throws InvalidPositionException{
		return null;
	}
	
}
