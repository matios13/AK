package mateusz.manka.gf;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;

public class GF {

	public static boolean[] add(boolean[] a, boolean[] b){
		boolean[] sum = new boolean[a.length];
		for(int i=0;i<a.length;i++){
			sum[i]=a[i]^b[i];
		}
		return sum;
		
	}
	public static void display(boolean[] a){
		for(boolean b : a){
			if(b)
				System.out.print(1);
			else
				System.out.print(0);
		}
			
	}
	
	public static boolean[] multiple(boolean[] a, boolean[] b){
		ArrayList<boolean[]> subsum = new ArrayList<>();
		boolean[] sum = new boolean[a.length];
		int p =0 ;
		for(int i=a.length-1;i>-1;i--){
			if(b[i]){
				subsum.add(swap(a,p));
			}
			p++;
		}
		if(subsum.size()==0){
			boolean[] r = {false,false};
			return r;
		}
		sum=subsum.get(0);
		for(int i=1;i<subsum.size();i++){
			sum=add(sum, subsum.get(i));
		}
		return sum;
		
	}
	
	public static boolean[] swap(boolean[] a , int w){
		boolean[] s = new boolean[a.length];
		int j=0;
		for(int i = w ;i<a.length;i++){
			s[j]=a[i];
			j++;
		}
		for(int i = 0 ;i<w;i++){
			s[j]=a[i];
			j++;
		}
		return s;
	}
	
	public static boolean[] stringToArr(String number, int baza){
		int length=baza;
		if (number==null||number.length()==0){
			return null;
		}
		boolean[] bitNumber = new boolean[length];
		int j=0;
		for(int i =length-number.length();i<length;i++){
			int bit = 0;
			try{
				bit = Integer.valueOf(number.charAt(j)-48);
			}catch(Exception e){
				return null;
			}
			if(bit==0){
				bitNumber[i]=false;
			}else if(bit==1){
				bitNumber[i]=true;
			}else{
				return null;
			}
			j++;
		}
		return bitNumber;
	}
	 public static void main(String[] args) {
		String tempNumber;
		boolean[] number1;
		boolean[] number2;
		int baza = 0;
		System.out.println("podaj wielkosc bazy : " );
		Scanner scanIn = new Scanner(System.in);
		baza = scanIn.nextInt();
		while(true){
			System.out.println("pierwsza liczba : " );
	    	tempNumber = scanIn.nextLine();
	    	number1=stringToArr(tempNumber,baza);
	    	if(number1!=null)
	    		break;
		}
		while(true){
			System.out.println("\n\n druga liczba : " );
		    tempNumber = scanIn.nextLine();
	    	tempNumber = scanIn.nextLine();
	    	number2=stringToArr(tempNumber,baza);
	    	if(number2!=null)
	    		break;
		}
	    System.out.println("\nLiczba 1 : ");
	    display(number1);
	    System.out.println("\nLiczba 2 : ");
	    display(number2);
	    boolean[] mnozenie= multiple(number1, number2);
	    boolean[] dodawanie= add(number1, number2);
	    System.out.println("\nWYNIK MNOZENIA : ");
	    display(mnozenie);
	    System.out.println("\nWYNIK Dodawania : ");
	    display(mnozenie);
	}
}
