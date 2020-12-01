package com.example.aone

import android.content.Context
import android.database.DataSetObserver
import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.view.ViewManager
import android.widget.BaseAdapter
import android.widget.ListAdapter
import android.widget.ListView
import android.widget.TextView
import org.jetbrains.anko.*
import org.jetbrains.anko.custom.ankoView
import org.jetbrains.anko.support.v4.swipeRefreshLayout
import org.jetbrains.anko.recyclerview.v7.recyclerView as recyclerView


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
//        setContentView(R.layout.activity_main)


        val c = Cat()
        c.onClick {
           Log.e("SAF_L",c.name)
        }
        val d = Dog()
        var arr = arrayOf(c,d)

        verticalLayout {
            padding = dip(30)

            editText {
                hint = "Password"
                textSize = 24f
            }
            button("登录") {
                textSize = 26f
            }
            for ( r in arr){
                val r1 = r.render
                r1()
            }

        }



    }


}



open class Cat{

    var name = "cat"
    private var callBack: (() -> Unit)? = null
    fun onClick(call:()->Unit){
        callBack = call

    }
    open var render:ViewManager.()->View = {

        button {
            hint = name
            textSize = 24f
            onClick {
                callBack?.let { it1 -> it1() }
            }
        }
    }

}
class Dog:Cat(){
    override var render:ViewManager.()->View = {
        button {
            hint = "Dog"
            textSize = 24f

        }
    }
}
