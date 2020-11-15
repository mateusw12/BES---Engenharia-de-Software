package br.univille.estd.tree;

import java.util.Collection;
import java.util.Iterator;

public class Position<E> {
	
	private E element;
	private Position<E> parent;
	private Collection<Position<E>> children;
	
	public Position() {
		this(null,null);
	}
	
	public Position(E element) {
		this(element,null);
	}
	
	public Position(E element, Position<E> parent) {
		setElement(element);
		setParent(parent);
	}

	public E getElement() {
		return element;
	}

	public void setElement(E element) {
		this.element = element;
	}

	public Position<E> getParent() {
		return parent;
	}

	public void setParent(Position<E> parent) {
		this.parent = parent;
	}
	
	public Position<E> addChild(Position<E> child) {
		return null;
	}
	
	public Position<E> addChild(E element) {
		return null;
	}
	
	public Position<E> removeChild(Position<E> child){
		return null;
	}
	
	public Iterator<Position<E>> getChildren(){
		return null;
	}
	
	public int size() {
		return 0;
	}
	

}
